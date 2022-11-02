Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41095616383
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 14:13:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqDYV-0004f8-Eq; Wed, 02 Nov 2022 09:13:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oqDYT-0004eY-MD
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 09:13:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oqDYS-0000rg-5C
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 09:13:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667394795;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dScPLeOCnEc1eBSE94tWRR71hDJdsiX9D8xQjYQuIUE=;
 b=hQh25VAoQ/+4vhbUfGUJvwRtKd2bNtEpjtA333T1McX7xbjPBp9ak0fVXQ4WrLdE/Gpx4p
 gCIz2TdzGKehpTw8g5iBWNDU2bfXKXyvbNiOXYySLo31MR0cQgD9MSC7P1Hy78NwmCfHpG
 9Pv16bpXsNwGDkDGJiv2k/jKKyeZQ7o=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-607-VcW_SfZ7Oli9Jb3484zYQA-1; Wed, 02 Nov 2022 09:13:14 -0400
X-MC-Unique: VcW_SfZ7Oli9Jb3484zYQA-1
Received: by mail-ed1-f70.google.com with SMTP id
 e15-20020a056402190f00b00461b0576620so11978690edz.2
 for <qemu-devel@nongnu.org>; Wed, 02 Nov 2022 06:13:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dScPLeOCnEc1eBSE94tWRR71hDJdsiX9D8xQjYQuIUE=;
 b=HgbS8BP4ykeq45aOrLj1DRE6jzsQ8C31XT8pxXfKXS9gp3LmiHPL7oOBbtCsbz6wzA
 pesw2vP6RIg1fYgXeArNizSVHRF78v15m5r1efeJUsrAVhJwPilAv58vNY8DDYdXOnQ5
 IVn2FiDeMYtXE8ss8TZYk7bC3fOO5SiHB2YcL2xYGzUbDSffPXZEwFsvKaoi60j8C2Pk
 zns17A6xNIvwEM4NpkeekAIBski4whnEWdMgjsnIvu9xnsthyaeOTjZpRlJ+hrtpr1/n
 1QGGKbEZ8NC0gO0zVdd4TWxrUPUg+6n+1Dr4Eh83jz/SXX/u5IeccAJT/SXo6xk3GXCI
 wk7A==
X-Gm-Message-State: ACrzQf1KtkTHSkmWaVqSCdlpoqv3NB6fjxsCYNN7mZgyCXRCzlIIKd2T
 AfB6Wo6+DF0lan1ToSH723rfCtiVP9hnEEDJY5XWdRlI0+zDiZEyfLZhmirVqyw0SbSf6ruML9p
 pCrJ9sypSLsmd2xw=
X-Received: by 2002:a17:907:6d9b:b0:78d:f24b:e358 with SMTP id
 sb27-20020a1709076d9b00b0078df24be358mr23008217ejc.714.1667394792901; 
 Wed, 02 Nov 2022 06:13:12 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5wGMG8wVhBzN3uBua2T3BgmNL2ABbVPMQohlSYEM9K88H5M6ATAgAkUbfiLBwnf5V04rVdfA==
X-Received: by 2002:a17:907:6d9b:b0:78d:f24b:e358 with SMTP id
 sb27-20020a1709076d9b00b0078df24be358mr23008202ejc.714.1667394792709; 
 Wed, 02 Nov 2022 06:13:12 -0700 (PDT)
Received: from ?IPV6:2001:b07:add:ec09:c399:bc87:7b6c:fb2a?
 ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.googlemail.com with ESMTPSA id
 my15-20020a1709065a4f00b0078d38cda2b1sm5313951ejc.202.2022.11.02.06.13.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Nov 2022 06:13:12 -0700 (PDT)
Message-ID: <a730485a-06be-0b5b-8caf-03e8a6922062@redhat.com>
Date: Wed, 2 Nov 2022 14:13:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: Using QEMU for VRChat
Content-Language: en-US
To: danko babro <dankobabro@gmail.com>, qemu-devel@nongnu.org
References: <CADfEUTJ4AvfUnwcWtiBk+V1gXrGt6W8cpxcUMbx_MtociwEC7g@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CADfEUTJ4AvfUnwcWtiBk+V1gXrGt6W8cpxcUMbx_MtociwEC7g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 8/10/22 13:06, danko babro wrote:
> https://docs.vrchat.com/docs/using-vrchat-in-a-virtual-machine 
> <https://docs.vrchat.com/docs/using-vrchat-in-a-virtual-machine>
> 
> I simply cant understand what that code (on the given website) does. 
> Does it open up a backdoor for the anti cheat to access my real pc?

No, it just hides to the program the fact that it's running in a VM. 
The libvirt and QEMU sections both do the same thing, just talking to 
different programs.

Paolo


