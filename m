Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C76D1593314
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Aug 2022 18:24:49 +0200 (CEST)
Received: from localhost ([::1]:38144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNctU-0000wP-31
	for lists+qemu-devel@lfdr.de; Mon, 15 Aug 2022 12:24:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oNcfq-0008NQ-Qg
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 12:10:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oNcfn-0003xS-Ec
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 12:10:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660579837;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LVkTLSC8Lvh7f24wfCc3hsfrtxmDALzbKqd1bC56xEI=;
 b=MDAENYT8gSNSAlInnx3sJPBjUighcEpC2SJqolvJevpDQMBmYPsRe0s/nsZTtByHUZUMhV
 XzFh44dihxUqJn9K2vkN+lRABaafjU2RrnJPc6cDakLU7q7Tw0n4zPEii79+IuZ2uibMmP
 t+/hdslSHm4JhvuHNnIhy3NnA30nfZ0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-22-IQhUfHB2Oy6NEP_7d0JaCA-1; Mon, 15 Aug 2022 12:10:36 -0400
X-MC-Unique: IQhUfHB2Oy6NEP_7d0JaCA-1
Received: by mail-wr1-f71.google.com with SMTP id
 p9-20020adfba89000000b002238405b027so1317791wrg.17
 for <qemu-devel@nongnu.org>; Mon, 15 Aug 2022 09:10:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=LVkTLSC8Lvh7f24wfCc3hsfrtxmDALzbKqd1bC56xEI=;
 b=fovrWBYalXi/fSqlOwNA1hPzXCQvABq/MRlvZGww1eGEdViryiHSDxWTmn92c5isdF
 jc/rQ0SjDlsEiazmOZAlzwPKJxdqZkKfvKP1dSX7DULGdABbRmf1Jh1zJZQxvHXnKUpn
 hVFrBw3fqcM1mYsSj6T8132rzYbH8qHB5wpclDv8M5JnC8Mj5YwFVHX3LA2gTdYrvLAB
 nQJZww8MYtIqTUz0llRVcP3nBc1ZLCKoAdLEx6QzB02JwOH9Xkx+WJmrLVtqvnO/Nz0x
 lQZnMZwe8n/5Q1TIeA2WZEaoaq+2eYVXQTAJRfIHd+48YRgEa9SRZY4+hx0xwHbhtBHf
 D+0A==
X-Gm-Message-State: ACgBeo3r68y+BCWMKkIZgyNKmzMDE/xV78S2q+modccz7nq68v+cNkiS
 /f2Ijs79hEZUPdbHubYIADPiRI0IrY4wol8r/7Zwo3Q201ZUnKU4XnUIBO7ZkuodgkX35qPqciE
 Wkx301gOIM8qQJQg=
X-Received: by 2002:a05:600c:5108:b0:3a5:c1b5:ba88 with SMTP id
 o8-20020a05600c510800b003a5c1b5ba88mr12613769wms.204.1660579834979; 
 Mon, 15 Aug 2022 09:10:34 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7QS9a5oGG2qSfmVJxUmlckJANLQCOI5Iprt+bQCFxsxBw9o9Au0CE9O+ZzN7kcfQitbUDJaA==
X-Received: by 2002:a05:600c:5108:b0:3a5:c1b5:ba88 with SMTP id
 o8-20020a05600c510800b003a5c1b5ba88mr12613755wms.204.1660579834698; 
 Mon, 15 Aug 2022 09:10:34 -0700 (PDT)
Received: from [192.168.8.103] (tmo-096-168.customers.d1-online.com.
 [80.187.96.168]) by smtp.gmail.com with ESMTPSA id
 p35-20020a05600c1da300b003a35ec4bf4fsm10232925wms.20.2022.08.15.09.10.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Aug 2022 09:10:34 -0700 (PDT)
Message-ID: <9e3a4a71-7d96-9fab-2d4e-4167b2f248f7@redhat.com>
Date: Mon, 15 Aug 2022 18:10:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To: vaishu venkat <vaishu071998@gmail.com>, qemu-devel@nongnu.org
References: <CAEcBaE1DOVtq+D1jh42ZO01guWo_zVRbFWoAOigpD2xm0YPSKQ@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: Bluetooth support in QEMU
In-Reply-To: <CAEcBaE1DOVtq+D1jh42ZO01guWo_zVRbFWoAOigpD2xm0YPSKQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/08/2022 13.27, vaishu venkat wrote:
> Hi team,
>              We are currently required to use QEMU for virtualization of 
> customized application. The application requires Bluetooth and Wi-fi 
> support, as observed below warning,
> *qemu-system-aarch64: -bt hci,host: warning: The bluetooth subsystem is 
> deprecated and will be removed soon. If the bluetooth subsystem is still 
> useful for you, please send a mail to qemu-devel@nongnu.org 
> <mailto:qemu-devel@nongnu.org> with your usecase.*
> 
>   Could you please help us with the support of bluetooth in QEMU.

Which version of QEMU are you using? Bluetooth support has been completely 
removed in QEMU v5.0.0 (which was released more than two years ago already) 
since nobody spoke up saying that they were still using the completely 
bit-rotten code. So sorry, but it's gone now and cannot be used anymore in 
recent versions.

If you just need access to real bluetooth devices in the guest, you could 
try to passthrough a real bluetooth USB device to the guest instead.

  HTH,
   Thomas


