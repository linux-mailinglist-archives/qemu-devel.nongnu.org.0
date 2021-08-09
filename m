Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C78E63E442D
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 12:49:13 +0200 (CEST)
Received: from localhost ([::1]:41250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD2qG-0007YQ-Rq
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 06:49:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mD2p3-0006Pf-HN
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 06:47:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40625)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mD2p2-0002Fx-2f
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 06:47:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628506075;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fiXYAklSPFGw6jakFFDcUh/Plv4cy1L9dTWtzINvtAg=;
 b=KbK9wSCb6NDjiRxOBlgWT1CeMSNFqOtvhWJ6TqY3gok+x1ILtoku5xxyTgJIvdKkGsseh5
 0hu5/jspH0tUYqqGuFMyaRFIpLUAsA1ptru8V7+uFQS+WuNGCoCZ6VKritVJkau2jZho6K
 snDdXBdTzpyCOrdMZgT6zcXtmuBAfA4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-272-U2K4eYLqM2Waw_6IIl8sGg-1; Mon, 09 Aug 2021 06:47:52 -0400
X-MC-Unique: U2K4eYLqM2Waw_6IIl8sGg-1
Received: by mail-wm1-f72.google.com with SMTP id
 n32-20020a05600c3ba0b02902e674c68feeso1728995wms.3
 for <qemu-devel@nongnu.org>; Mon, 09 Aug 2021 03:47:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fiXYAklSPFGw6jakFFDcUh/Plv4cy1L9dTWtzINvtAg=;
 b=tjGiBephQriBCHva/tLv6IAZGWVW0j0eX/h6zPyawRgDhM0OJ+zYchZeMFpxwcwBsn
 WfzbvfYImVtEKqTjL3K4Jr37yBvJRAMAh1FhsteiZHDjBNUHbTF3q/enlj4x1KvAP7Rh
 IjWda1cjL8xqp870zPLgtJaGDFBn0PueOFYqS56Mjxa9hCcbUXTMhxCaG38GS/1sEWXL
 XeJ4zXCFcrK80HqcWFOH7nMbWYhnkJEAsCT3JfZxCb2SFyPnpn9xqYH/bekfqeynWx01
 DQ/qUTw53dEcagmKwWiocEArGYyt26bt4CYwj91f4vWCx5rZ86KbAuTHpMpNgalNwAUf
 DPmw==
X-Gm-Message-State: AOAM530733A5VuCplZfUUV1QUZxstHUTER0UzXLdVkBCT24Fk9fKv1zZ
 RTxNaQ56Qtut1eTN/u0xYn4o01cD9P0pL2CyWsv6pfomwazMbW4SLwCIjQicpllWocmv0Wx5l0w
 twJ40NdJR7L+MZ0I=
X-Received: by 2002:a1c:4d13:: with SMTP id o19mr17136416wmh.32.1628506071163; 
 Mon, 09 Aug 2021 03:47:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxenPXbe6tvqhqfa30PRxp7TGTYfMlGQmSmZYbi2O44bjJ9nbGDBbMbqJpmnUL2ihJAZ5e5hg==
X-Received: by 2002:a1c:4d13:: with SMTP id o19mr17136402wmh.32.1628506071010; 
 Mon, 09 Aug 2021 03:47:51 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id a191sm16880920wme.15.2021.08.09.03.47.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Aug 2021 03:47:50 -0700 (PDT)
Subject: Re: [PATCH-for-6.1?] hw/nvme: fix missing variable initializers
To: Klaus Jensen <its@irrelevant.dk>, qemu-devel@nongnu.org
References: <20210809104324.49434-1-its@irrelevant.dk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <a28fd42a-1766-c1cc-6a6c-9b5f8321e30f@redhat.com>
Date: Mon, 9 Aug 2021 12:47:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210809104324.49434-1-its@irrelevant.dk>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.707,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Keith Busch <kbusch@kernel.org>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/9/21 12:43 PM, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> Coverity found that 'uuid', 'csi' and 'eui64' are uninitialized. While
> we set most of the fields, we do not explicitly set the rsvd2 field in
> the NvmeIdNsDescr header.
> 
> Fix this by explicitly zero-initializing the variables.
> 
> Reported-by: Coverity (CID 1458835, 1459295 and 1459580)
> Fixes: 6870cfb8140d ("hw/nvme: namespace parameter for EUI-64")
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> ---
>  hw/nvme/ctrl.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


