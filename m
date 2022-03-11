Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A021E4D617A
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Mar 2022 13:25:35 +0100 (CET)
Received: from localhost ([::1]:44126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSeKs-0002Mr-6P
	for lists+qemu-devel@lfdr.de; Fri, 11 Mar 2022 07:25:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nSeGq-00073H-51
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 07:21:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32250)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nSeGm-00051Q-Ck
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 07:21:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647001279;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OJg3UrbC9SPl/VCaKxQ2q/HYI3sIpoEXlqBNppYyo7U=;
 b=Y/+1yKTUQEMv0ryKitV6l+VciGS9Jcj/R+lDzNxJxKc33geS951i3mftNH+haLtHrvKjEw
 XrLRPDwEdpOUjttIiAn5c+pTJ21LTmJxFNUWcl3Mcep/1k8vzlcxmoGPuZD5gA/Z3t1h8z
 roWEu9Gb6RcLLN8YqsLMWqLx70WRjo4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-381-ttlgSFPuPyCjEBPBUkpr7w-1; Fri, 11 Mar 2022 07:21:16 -0500
X-MC-Unique: ttlgSFPuPyCjEBPBUkpr7w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74AAC180FD71;
 Fri, 11 Mar 2022 12:21:15 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 698C01059139;
 Fri, 11 Mar 2022 12:20:50 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id EEEBE21E6A00; Fri, 11 Mar 2022 13:20:48 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Kshitij Suri <kshitij.suri@nutanix.com>
Subject: Re: [PATCH v2 2/2] Added parameter to take screenshot with
 screendump as PNG.
References: <20220301064424.136234-1-kshitij.suri@nutanix.com>
 <20220301064424.136234-2-kshitij.suri@nutanix.com>
Date: Fri, 11 Mar 2022 13:20:48 +0100
In-Reply-To: <20220301064424.136234-2-kshitij.suri@nutanix.com> (Kshitij
 Suri's message of "Tue, 1 Mar 2022 06:44:24 +0000")
Message-ID: <871qz88yu7.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: soham.ghosh@nutanix.com, thuth@redhat.com, prerna.saxena@nutanix.com,
 qemu-devel@nongnu.org, dgilbert@redhat.com, kraxel@redhat.com,
 prachatos.mitra@nutanix.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Kshitij Suri <kshitij.suri@nutanix.com> writes:

> Currently screendump only supports PPM format, which is un-compressed and not
> standard. Added a "format" parameter to qemu monitor screendump capabilites
> to support PNG image capture using libpng. The param was added in QAPI schema
> of screendump present in ui.json along with png_save() function which converts
> pixman_image to PNG. HMP command equivalent was also modified to support the
> feature.
>
> Example usage:
> { "execute": "screendump", "arguments": { "filename": "/tmp/image",
> "format":"png" } }
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/718
>
> Signed-off-by: Kshitij Suri <kshitij.suri@nutanix.com>
> ---

[...]

> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
> index 8c384dc1b2..9a640146eb 100644
> --- a/monitor/hmp-cmds.c
> +++ b/monitor/hmp-cmds.c
> @@ -1677,9 +1677,26 @@ hmp_screendump(Monitor *mon, const QDict *qdict)
>      const char *filename = qdict_get_str(qdict, "filename");
>      const char *id = qdict_get_try_str(qdict, "device");
>      int64_t head = qdict_get_try_int(qdict, "head", 0);
> +    const char *input_format  = qdict_get_str(qdict, "format");
>      Error *err = NULL;
> +    ImageFormat format;
>  
> -    qmp_screendump(filename, id != NULL, id, id != NULL, head, &err);
> +    int val = qapi_enum_parse(&ImageFormat_lookup, input_format, -1, &err);
> +    if (val < 0) {
> +        goto end;
> +    }
> +
> +    switch (val) {
> +    case IMAGE_FORMAT_PNG:
> +        format = IMAGE_FORMAT_PNG;
> +        break;
> +    default:
> +        format = IMAGE_FORMAT_PPM;
> +    }
> +
> +    qmp_screendump(filename, id != NULL, id, id != NULL, head,
> +                   input_format != NULL, format, &err);
> +end:
>      hmp_handle_error(mon, err);
>  }
>  
> diff --git a/qapi/ui.json b/qapi/ui.json
> index 9354f4c467..6aa0dd7c1b 100644
> --- a/qapi/ui.json
> +++ b/qapi/ui.json
> @@ -73,12 +73,27 @@
>  ##
>  { 'command': 'expire_password', 'data': {'protocol': 'str', 'time': 'str'} }
>  
> +##
> +# @ImageFormat:
> +#
> +# Available list of supported types.

This is just a hair better than "Lorem ipsum" :)

Suggest: Supported image format types.

> +#
> +# @png: PNG format
> +#
> +# @ppm: PPM format
> +#
> +# Since: 7.0
> +#
> +##
> +{ 'enum': 'ImageFormat',
> +  'data': ['ppm', 'png'] }
> +
>  ##
>  # @screendump:
>  #
> -# Write a PPM of the VGA screen to a file.
> +# Write a screenshot of the VGA screen to a file.

Is "VGA screen" accurate?  Or does this work for other displays, too?

>  #
> -# @filename: the path of a new PPM file to store the image
> +# @filename: the path of a new file to store the image
>  #
>  # @device: ID of the display device that should be dumped. If this parameter
>  #          is missing, the primary display will be used. (Since 2.12)
> @@ -87,6 +102,9 @@
>  #        parameter is missing, head #0 will be used. Also note that the head
>  #        can only be specified in conjunction with the device ID. (Since 2.12)
>  #
> +# @format: image format for screendump is specified. ppm is the set as the
> +#          default format. (Since 7.0)

I figure you mean "is set as the default".  Suggest to replace the
sentence by "(default: ppm)".

> +#
>  # Returns: Nothing on success
>  #
>  # Since: 0.14
> @@ -99,7 +117,8 @@
>  #
>  ##
>  { 'command': 'screendump',
> -  'data': {'filename': 'str', '*device': 'str', '*head': 'int'},
> +  'data': {'filename': 'str', '*device': 'str', '*head': 'int',
> +           '*format': 'ImageFormat'},
>    'coroutine': true }
>  
>  ##

[...]


