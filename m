Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6682A6309
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Nov 2020 12:13:59 +0100 (CET)
Received: from localhost ([::1]:54098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kaGjm-0007uU-9h
	for lists+qemu-devel@lfdr.de; Wed, 04 Nov 2020 06:13:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kaGeT-0002OP-Mq
 for qemu-devel@nongnu.org; Wed, 04 Nov 2020 06:08:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kaGeS-0007lC-0k
 for qemu-devel@nongnu.org; Wed, 04 Nov 2020 06:08:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604488107;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hAf78Bvq+h0WF9n0o+wWz3qZ5VaeKlOmL7Xj76X2ocY=;
 b=VO/Mf5ZJn6biSLQPb/Z252N7kW627iiHK6HADS8HeBbrIbj/V0PLvogZuWLfJokSLIWTqF
 lD+CqQfN3zaUaQyP55aJ4oRgnGXXIwwljrBEF1DciEQE5OZKMmPIH08I4GP64VeSVdQ0f+
 bgkEY42I8yANQMJKH6vl5MA+sqwJfhQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-405-GxFo3HsjOjiSDZ2q0izt_w-1; Wed, 04 Nov 2020 06:08:25 -0500
X-MC-Unique: GxFo3HsjOjiSDZ2q0izt_w-1
Received: by mail-wr1-f69.google.com with SMTP id m20so9134291wrb.21
 for <qemu-devel@nongnu.org>; Wed, 04 Nov 2020 03:08:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hAf78Bvq+h0WF9n0o+wWz3qZ5VaeKlOmL7Xj76X2ocY=;
 b=XFeX/LnmBSqpMcC0qlGv4p6iGgxzX+bR+hg6SZCTzItsgf0TSuDYGRbW0MomkAidf7
 qhDq3LONJnGgrydL7iYzGvt93B7H8xW9uckBA90u74Tw2uvnWhU+p4cFjilG7hhSxMCg
 eHHVArIaWxkN5nkJPBj+V73KPtlFvHcx3beNM6E7ny/z/XMGVcWSY29mqRHwX/ncwGrl
 I8UUEfOyJCpJIhJqOtdcvVMkRsZ3ELxRdIbxmvJlO+qrwMyE9SSdvys+sIbP8/eMTwjU
 KhVKE4MVYh2MSFD1kqVphPEU9oyg6LVWJtjovPqX612tm62pKPq/x7uVR/uVhiN7PGfb
 4BEQ==
X-Gm-Message-State: AOAM531uiK47ZCK0QcOY3yCb92mf+2eYmyjegZ7vmXqRJcO/jolRTS2L
 1ktAsnqHFu1QqMI4BepDWi/WFKZjjOE3UxB8njjTRKHar3MgwMKz+nwB1a7KK0WnLNfCNhqHHC5
 ikNWP2QTGcGexNzA=
X-Received: by 2002:a1c:4909:: with SMTP id w9mr3882856wma.15.1604488104826;
 Wed, 04 Nov 2020 03:08:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzkrxIXqARghnNe1ThjO22p9PZzdtQEVYJqwhQobRomlUnBjzvLNceXxrqQ9D/Jb6cJwxCsAA==
X-Received: by 2002:a1c:4909:: with SMTP id w9mr3882824wma.15.1604488104489;
 Wed, 04 Nov 2020 03:08:24 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id v6sm1699547wmj.6.2020.11.04.03.08.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Nov 2020 03:08:23 -0800 (PST)
Subject: Re: [PATCH for-5.2 1/3] hw/block/nvme: fix null ns in register
 namespace
To: Klaus Jensen <its@irrelevant.dk>, qemu-devel@nongnu.org
References: <20201104102248.32168-1-its@irrelevant.dk>
 <20201104102248.32168-2-its@irrelevant.dk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <db19077f-e8a9-0a59-7f7d-7b1ccbaf1b5b@redhat.com>
Date: Wed, 4 Nov 2020 12:08:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201104102248.32168-2-its@irrelevant.dk>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/03 00:03:41
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, Dmitry Fomichev <dmitry.fomichev@wdc.com>,
 Klaus Jensen <k.jensen@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Minwoo Im <minwoo.im.dev@gmail.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/4/20 11:22 AM, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> Fix dereference after NULL check.
> 
> Reported-by: Coverity (CID 1436128)
> Fixes: b20804946bce ("hw/block/nvme: update nsid when registered")
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> ---
>  hw/block/nvme.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> index fa2cba744b57..080d782f1c2b 100644
> --- a/hw/block/nvme.c
> +++ b/hw/block/nvme.c
> @@ -2562,8 +2562,7 @@ int nvme_register_namespace(NvmeCtrl *n, NvmeNamespace *ns, Error **errp)
>  
>      if (!nsid) {
>          for (int i = 1; i <= n->num_namespaces; i++) {
> -            NvmeNamespace *ns = nvme_ns(n, i);
> -            if (!ns) {
> +            if (!nvme_ns(n, i)) {
>                  nsid = ns->params.nsid = i;

Uh.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

>                  break;
>              }
> 


