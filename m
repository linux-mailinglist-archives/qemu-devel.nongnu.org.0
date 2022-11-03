Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E26618613
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 18:23:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqdvV-0003rG-En; Thu, 03 Nov 2022 13:22:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oqdvU-0003pp-GH
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 13:22:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oqdvT-0002Nd-4L
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 13:22:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667496166;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EMtLscuM+GkhtCSMJR6gBFiXWZfzwaCGy/BE14Qb5hs=;
 b=ViCZij4wlkLAezSzEOQbWPIjJ5k64veB71CcdmEt3ivhfzAE1a9aIiNz3dcZu3p6U7phek
 3fWODQjtsuJB5xUE+V09qvHJNPqPn7wNp3cCcLLWlnyX914ONDCs5qjITQk2sPz9WmCpa6
 +NqOWzp/JjEV9fJ4o4QkG1Fcx/s0yCg=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-451-jjInOxv4PqGlGAkMyrEcjw-1; Thu, 03 Nov 2022 13:22:45 -0400
X-MC-Unique: jjInOxv4PqGlGAkMyrEcjw-1
Received: by mail-ed1-f69.google.com with SMTP id
 h9-20020a05640250c900b00461d8ee12e2so1843034edb.23
 for <qemu-devel@nongnu.org>; Thu, 03 Nov 2022 10:22:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EMtLscuM+GkhtCSMJR6gBFiXWZfzwaCGy/BE14Qb5hs=;
 b=rmjdjyqaJPOuVQBVtQSpwVj4hZfFpFsrWcLKprot8XL3UC/xgpGb5Q0O8UsB6Eahoy
 QMM6+6W5tmmbOGkPkFUzpQkr7XDWjWj4SprVVc+YeeAxwz7nH0tAF60Sl0UU4c9IkfGK
 NFlAsexUHqC1hpiM2Ex4IjhFFL4oiLLuz4E/NIGz3qtsHOZdMo7f9ku5juJBWrSyIGac
 AK/OQBpayH3LndBTKpYKIuWjvGluEGk4xQHDgqOnHabTdSzmMcoPN/2POoMhdRLrcG2o
 33NcIEZgHqlnj5hXoBrdJwZKwqtuEXuvLk2lXEGjOXbIN86if3UJmYBSBoFik17Q+/hO
 WWDQ==
X-Gm-Message-State: ACrzQf32YIn3cjzuW3xuHs4G7bvbaHRH9CU+dUud6MutlsGdGH8uByfA
 fC2PowooxCNJOl62kcgGefE+J+XHcfXqHPc2x/v6YorkiBsPCSHrEAkCYjeAtmLwOwvm7gVXbdw
 t6JujwPKCtFztG4Q=
X-Received: by 2002:a17:906:6a8d:b0:741:6a3b:536e with SMTP id
 p13-20020a1709066a8d00b007416a3b536emr30756309ejr.11.1667496163851; 
 Thu, 03 Nov 2022 10:22:43 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6ZRZ4cw0H8szIxejDDMt3WKonsXorBEMr+lfN1kHangTCJRJTwO2xj6P6cKdNMt/6lFAKHRA==
X-Received: by 2002:a17:906:6a8d:b0:741:6a3b:536e with SMTP id
 p13-20020a1709066a8d00b007416a3b536emr30756299ejr.11.1667496163664; 
 Thu, 03 Nov 2022 10:22:43 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:1c09:f536:3de6:228c?
 ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.googlemail.com with ESMTPSA id
 qq18-20020a17090720d200b007aa9156f7e9sm732511ejb.32.2022.11.03.10.22.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Nov 2022 10:22:43 -0700 (PDT)
Message-ID: <2b1a92c2-c081-aacd-da05-aa434f50bbaa@redhat.com>
Date: Thu, 3 Nov 2022 18:22:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH for 7.2] Fix broken configure with -Wunused-parameter
Content-Language: en-US
To: Stefan Weil <sw@weilnetz.de>, qemu-trivial@nongnu.org,
 qemu-devel@nongnu.org
References: <20221102202258.456359-1-sw@weilnetz.de>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20221102202258.456359-1-sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.047,
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

On 11/2/22 21:22, Stefan Weil via wrote:
> != "no"; then
>     cat > $TMPC << EOF
>   int main(int argc, char *argv[])
>   {
> +    (void)argc;
>       char arr[64], *p = arr, *c = argv[0];

You could use argv[argc - 1] instead.

Paolo

>       while (*c) {
>           *p++ = *c++;


