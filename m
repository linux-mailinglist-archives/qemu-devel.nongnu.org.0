Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FC96A7D12
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 09:53:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXegp-0002Pw-2G; Thu, 02 Mar 2023 03:53:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXegm-0002Pn-Rx
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:53:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXegl-0006cH-9g
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:53:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677747202;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=36l8ARsxQVnqmJuYNwyH+AgAgVxRctrGlmrnokt0ynU=;
 b=ZsfFo0TG0DgOu0SMUGD7sK/iwq0v+6GwrHQ8JgeJuqwuzaABwkWLptQrSOnfEQkK/M513v
 mIRPGaPjDX+v9F+vYalxNMu64AlxXrThHLrMzCR0FvSgDEF2HahXjCdAL0xEBGUl+iZHgH
 Je6yAc8YYNuqTmZGCYCkMmwcw158dz8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-371-90A8l_yZNxCGaEVSvSd4Kw-1; Thu, 02 Mar 2023 03:53:19 -0500
X-MC-Unique: 90A8l_yZNxCGaEVSvSd4Kw-1
Received: by mail-wr1-f70.google.com with SMTP id
 j2-20020adfa782000000b002ca9ab26627so2810745wrc.23
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 00:53:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677747198;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=36l8ARsxQVnqmJuYNwyH+AgAgVxRctrGlmrnokt0ynU=;
 b=AyYan6SHM5EckjUk7DVZXHOTQR2NH8vBoOSM5AcZG4XoWYIN/IGyov2pmhNDGcBvb6
 gkj/a9vJgA6ULGc95cVyh0Qi6gbch50SQVTplSozT2+fh4RmWtiMe4RRulZIJasfHimR
 XiUWBptwIyyLJmN1okRd0U7BwhSAclzDulvoVJBLfl8PY1YdtDd7uHI8LEwsgDA264KF
 6DVrnBZ+799aMW/lf2zbn7IHv+QNUD93/m9fE7qYrxINegC0mmt4/Umlm9Wg7P9p7RtL
 gdzW1VSHILzyJnLdU9KIgwwJZAG0hbBlO3IQACm3liyIqOp7+eJOpaaklpvxYjzq4bTc
 mKbQ==
X-Gm-Message-State: AO0yUKXKuPD+MmeLqsFI0arV5Dtpqto4hm+t8dV1ZU5IrB0eoiFvBmOF
 jUDklwKRMIoknC5Zf/bEZFgFNScQMbApyBzVWZgWtwnzW76BLyD3VTpi927agxXYjMG43bDrIER
 /SbRAf2AktYu8gx4=
X-Received: by 2002:a5d:6589:0:b0:2c7:c49:e881 with SMTP id
 q9-20020a5d6589000000b002c70c49e881mr6715398wru.20.1677747198311; 
 Thu, 02 Mar 2023 00:53:18 -0800 (PST)
X-Google-Smtp-Source: AK7set+NVA89JlK7we+WTWL0X3o1QzR2Bku5udXr2VUaZek7gThfimSgwyhnA/aukOM4kwER0UVIZg==
X-Received: by 2002:a5d:6589:0:b0:2c7:c49:e881 with SMTP id
 q9-20020a5d6589000000b002c70c49e881mr6715379wru.20.1677747198033; 
 Thu, 02 Mar 2023 00:53:18 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 e15-20020a5d594f000000b002c5d3f0f737sm14549215wri.30.2023.03.02.00.53.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 00:53:17 -0800 (PST)
Date: Thu, 2 Mar 2023 03:53:14 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 eduardo@habkost.net, berrange@redhat.com, pbonzini@redhat.com,
 marcel.apfelbaum@gmail.com, philmd@linaro.org,
 den-plotnikov@yandex-team.ru, antonkuchin@yandex-team.ru
Subject: Re: [PATCH v5 13/18] pci: introduce pci_find_the_only_child()
Message-ID: <20230302035048-mutt-send-email-mst@kernel.org>
References: <20230216180356.156832-1-vsementsov@yandex-team.ru>
 <20230216180356.156832-14-vsementsov@yandex-team.ru>
 <20230301160855-mutt-send-email-mst@kernel.org>
 <ab95ffbd-98c4-70f0-c547-55436118f7a2@yandex-team.ru>
 <20230302033437-mutt-send-email-mst@kernel.org>
 <9ca5a8be-5add-ce57-d613-e09dee08ab6a@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9ca5a8be-5add-ce57-d613-e09dee08ab6a@yandex-team.ru>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Mar 02, 2023 at 11:45:00AM +0300, Vladimir Sementsov-Ogievskiy wrote:
> On 02.03.23 11:37, Michael S. Tsirkin wrote:
> > On Thu, Mar 02, 2023 at 11:28:44AM +0300, Vladimir Sementsov-Ogievskiy wrote:
> > > On 02.03.23 00:09, Michael S. Tsirkin wrote:
> > > > On Thu, Feb 16, 2023 at 09:03:51PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> > > > > To be used in further patch to identify the device hot-plugged into
> > > > > pcie-root-port.
> > > > > 
> > > > > Signed-off-by: Vladimir Sementsov-Ogievskiy<vsementsov@yandex-team.ru>
> > > > > Reviewed-by: Anton Kuchin<antonkuchin@yandex-team.ru>
> > > > Wait a second does this work for multifunction devices correctly?
> > > > 
> > > 
> > > I thought about that and I'm just lost:)
> > > 
> > > Could several (multifunction?) devices be plugged into one pcie-root-port device?
> > 
> > One device per port but one multifunction device is represented as multiple PCIDevice structures.
> 
> So, it should be OK to send _one_ event for that multifunction device, and the code is shpc_reset() is OK, but reporting "Several child devices found" is bad idea?

I don't know about your new event, we are discussing it separately.
yes all functions are removed together normally on real hardware.

> So, if I change the logic from pci_find_the_only_child() to pci_find_first_child() is it OK?

Yes though I don't like this name either - need to make it clear that
multifunction is ok, multiple unrelated devices aren't.


> > 
> > > Same question for SHPC slots. For example, shpc_free_devices_in_slot() looks like we can have several devices in one slot..
> > > On the other hand, in shpc_reset() we have construction shpc->sec_bus->devices[PCI_DEVFN(SHPC_IDX_TO_PCI(i), 0)] to access the device in slot. The only one device.
> > > 
> > > -- 
> > > Best regards,
> > > Vladimir
> > 
> > Same thing.
> > 
> > ... and let's not get started about sriov and ari ...
> > 
> 
> -- 
> Best regards,
> Vladimir


