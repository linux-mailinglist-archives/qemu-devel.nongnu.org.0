Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 672AE61029E
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 22:23:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo9Nh-0002hN-AN; Thu, 27 Oct 2022 16:21:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1oo9NZ-0002f8-Dg; Thu, 27 Oct 2022 16:21:30 -0400
Received: from dfw.source.kernel.org ([139.178.84.217])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1oo9NT-0003iK-4i; Thu, 27 Oct 2022 16:21:29 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7D803624CF;
 Thu, 27 Oct 2022 20:21:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 449DFC433D6;
 Thu, 27 Oct 2022 20:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666902072;
 bh=7eAiTSEpdsuBql/oqFicClKnB9v2obM9uUw25h529/c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=t/5LESro5sN0JoC5u5F9R1+gli0DuCKe0sZD6XI7CB1Or8x4Mi9fgdYpPZlG1DYGz
 x9SBh3i7raOo6BM29UOe65ipCty2JoKNsfBa3xFttqZhvzfeg5P9OF3OnbM1hQwHeX
 gLSQq68XEM63MjV2PFtVgiFHdcX4JOrQ8wWLLFk8BAKlPl7NqTu1kxoFTVR24UCkNf
 583gKXhcbg+QZjsicJVCsag5VKLOGqQ/KfM9SOsYBzCtBCltYV4aR6htkQ5Ctjr13b
 HvDIHuMWaXtD1R50ElVaf73EFbM5bMimw5H0CC4qniz9pm98v3VHUHHxVmR2b+mrCR
 UrZpkJc3iDxig==
Date: Thu, 27 Oct 2022 14:21:09 -0600
From: Keith Busch <kbusch@kernel.org>
To: Jonathan Derrick <jonathan.derrick@linux.dev>
Cc: qemu-devel@nongnu.org, Michael Kropaczek <michael.kropaczek@solidigm.com>,
 qemu-block@nongnu.org, Klaus Jensen <its@irrelevant.dk>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH v3 1/2] hw/nvme: Support for Namespaces Management from
 guest OS - create-ns
Message-ID: <Y1roNWIrCaJv3aGn@kbusch-mbp.dhcp.thefacebook.com>
References: <20221027180046.250-1-jonathan.derrick@linux.dev>
 <20221027180046.250-2-jonathan.derrick@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221027180046.250-2-jonathan.derrick@linux.dev>
Received-SPF: pass client-ip=139.178.84.217; envelope-from=kbusch@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -75
X-Spam_score: -7.6
X-Spam_bar: -------
X-Spam_report: (-7.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Oct 27, 2022 at 01:00:45PM -0500, Jonathan Derrick wrote:
> +Parameters:
> +
> +``auto-ns-path=<path to nvme storage location>``
> +  If specified indicates a support for dynamic management of nvme namespaces
> +  by means of nvme create-ns command. This path points
> +  to the storage area for backend images must exist. Additionally it requires
> +  that parameter `ns-subsys` must be specified whereas parameter `drive`
> +  must not. The legacy namespace backend is disabled, instead, a pair of
> +  files 'nvme_<ctrl SN>_ns_<NS-ID>.cfg' and 'nvme_<ctrl SN>_ns_<NS-ID>.img'
> +  will refer to respective namespaces. The create-ns, attach-ns
> +  and detach-ns commands, issued at the guest side, will make changes to
> +  those files accordingly.
> +  For each namespace exists an image file in raw format and a config file
> +  containing namespace parameters and state of the attachment allowing QEMU
> +  to configure namespaces accordingly during start up. If for instance an
> +  image file has a size of 0 bytes this will be interpreted as non existent
> +  namespace. Issuing create-ns command will change the status in the config
> +  files and and will re-size the image file accordingly so the image file
> +  will be associated with the respective namespace. The main config file
> +  nvme_<ctrl SN>_ctrl.cfg keeps the track of allocated capacity to the
> +  namespaces within the nvme controller.
> +  As it is the case of a typical hard drive, backend images together with
> +  config files need to be created. For this reason the qemu-img tool has
> +  been extended by adding createns command.
> +
> +   qemu-img createns {-S <serial> -C <total NVMe capacity>}
> +                     [-N <NsId max>] {<path>}
> +
> +  Parameters:
> +  -S and -C and <path> are mandatory, `-S` must match `serial` parameter
> +  and <path> must match `auto-ns-path` parameter of "-device nvme,..."
> +  specification.
> +  -N is optional, if specified it will set a limit to the number of potential
> +  namespaces and will reduce the number of backend images and config files
> +  accordingly. As a default, a set of images of 0 bytes size and default
> +  config files for 256 namespaces will be created, a total of 513 files.
> +
> +Please note that ``nvme-ns`` device is not required to support of dynamic
> +namespaces management feature. It is not prohibited to assign a such device to
> +``nvme`` device specified to support dynamic namespace management if one has
> +an use case to do so, however, it will only coexist and be out of the scope of
> +Namespaces Management. NsIds will be consistently managed, creation (create-ns)
> +of a namespace will not allocate the NsId already being taken. If ``nvme-ns``
> +device conflicts with previously created one by create-ns (the same NsId),
> +it will break QEMU's start up.

By requiring the controller's serial number up-front, does this mean we
can't share dynamic namespaces with other controllers in the subsystem?

> +static inline char *create_fmt_name(const char *fmt, char *ns_directory, char *serial, uint32_t nsid, Error **errp)
> +{
> +    char *file_name = NULL;
> +    Error *local_err = NULL;
> +
> +    storage_path_check(ns_directory, serial, errp);
> +    if (local_err) {

How is 'local_err' ever *not* NULL here? Are you meaning to check
"*errp" instead?

> +        error_propagate(errp, local_err);
> +    } else {
> +        file_name = g_strdup_printf(fmt, ns_directory, serial, nsid);
> +    }
> +
> +    return file_name;
> +}
> +
> +static inline char *create_cfg_name(char *ns_directory, char *serial, uint32_t nsid, Error **errp)
> +{
> +    return create_fmt_name(NS_FILE_FMT NS_CFG_EXT, ns_directory, serial, nsid, errp);
> +}
> +
> +
> +static inline char *create_image_name(char *ns_directory, char *serial, uint32_t nsid, Error **errp)
> +{
> +    return create_fmt_name(NS_FILE_FMT NS_IMG_EXT, ns_directory, serial, nsid, errp);
> +}
> +
> +static inline int nsid_cfg_save(char *ns_directory, char *serial, QDict *ns_cfg, uint32_t nsid)
> +{
> +    GString *json = NULL;
> +    char *filename;
> +    FILE *fp;
> +    int ret = 0;
> +    Error *local_err = NULL;
> +
> +    json = qobject_to_json_pretty(QOBJECT(ns_cfg), false);
> +
> +    if (strlen(json->str) + 2 /* '\n'+'\0' */ > NS_CFG_MAXSIZE) {
> +        error_setg(&local_err, "ns-cfg allowed max size %d exceeded", NS_CFG_MAXSIZE);

I find this whole "local_err" control flow unpleasant to follow. The
local_error gets set in this above condition only to be overwritten in
the very next step without ever being used? Surely that can't be right.

I'm just picking on this one example here, but the pattern appears to
repeat. I think this would be easier to read if the error conditions
took 'goto' paths to unwind so that the good path doesn't require such
deep 'if/else' nesting.

> +    }
> +
> +    filename = create_cfg_name(ns_directory, serial, nsid, &local_err);
> +    if (!local_err) {
> +        fp = fopen(filename, "w");
> +        if (fp == NULL) {
> +            error_setg(&local_err, "open %s: %s", filename,
> +                         strerror(errno));
> +        } else {
> +            chmod(filename, 0644);
> +            if (!fprintf(fp, "%s\n", json->str)) {
> +                error_setg(&local_err, "could not write ns-cfg %s: %s", filename,
> +                             strerror(errno));
> +            }
> +            fclose(fp);
> +        }
> +    }
> +
> +    if (local_err) {
> +        error_report_err(local_err);
> +        ret = -1;
> +    }
> +
> +    g_string_free(json, true);
> +    g_free(filename);
> +    qobject_unref(ns_cfg);
> +
> +    return ret;
> +}

