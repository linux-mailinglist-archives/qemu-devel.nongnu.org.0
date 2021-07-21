Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D743D1040
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 15:51:15 +0200 (CEST)
Received: from localhost ([::1]:34950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6Cd0-0003aE-D2
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 09:51:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m6Cbo-0002c7-MH
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 09:50:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m6Cbn-0005Ja-9H
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 09:50:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626875398;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=12UQaMI+9JTZy73XLa/eTSO60csNCbecqD2IwLogKB0=;
 b=ThNIL6tqFmrXKL1BFA4rmM6JryAsCuj4T4LHmyTOMBnUT02BCqS9CEvw6r/qNsZ6eG54IL
 rH/DxtN9PWdfbrDBW7/2OUxHsFAi9IBQQMW87s8E22qgCziuu35QERNSPSHQoGjReVyVA0
 OXogt7Vlvaf+dIeyKCr6U4pcVwkcY9w=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-316-ZXamCQsDPiO_eCpORRtSkA-1; Wed, 21 Jul 2021 09:49:56 -0400
X-MC-Unique: ZXamCQsDPiO_eCpORRtSkA-1
Received: by mail-wr1-f69.google.com with SMTP id
 5-20020a0560001565b029013fe432d176so1022738wrz.23
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 06:49:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=12UQaMI+9JTZy73XLa/eTSO60csNCbecqD2IwLogKB0=;
 b=uRuX99rrcg6kgXy7jWjUD8aae92pHQ3V5oKNF6kHeEK54EXG0qJopi/0iniUemMz7f
 90g/iGzvY//MA1i4bQj35zGvKFbo/8T84IQ0LT4MpkdWEjfnm06zNVY5pOsmCUm7wDW6
 B0KkQv+cOcn0PS47OoX5fxkBpOwoaMTgXqTpExzpSOa8DM44YdUIyub7dyPx+gjz795B
 NJNdi/6sCbYmh2q7CQpM/iEHMZL/oa/qr6idpQmNaou/baCLt8zQKUhqk6Ut13/12F1B
 u1a8bWIxhzabHvgxohnQapMlRWXgu/DPC31ydetbQ0Dwdj5oEWc0aW0wN57z6VW0pFFZ
 kcfg==
X-Gm-Message-State: AOAM533kgISsuIAkoPzbqAxZvWA/O/pWLn9aqkO4sVKxAYIKRBOxlQcd
 f44RUyhzvx2uDRCBmc0kpm700QjzPDV7yoZAinq2D/TxBCw+2lz09Yq84SR+c4FDTgvPBtQ6OeV
 NG1xmSQsttaRG3Yw=
X-Received: by 2002:a1c:63d6:: with SMTP id x205mr38574254wmb.42.1626875395641; 
 Wed, 21 Jul 2021 06:49:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzxTE1rSK3ovxE5rd1pqVsKiXxcQrgKeAwTBP/uqOfbQnlrF9FbDBu4+yl5XzDFaDy1erWx6Q==
X-Received: by 2002:a1c:63d6:: with SMTP id x205mr38574234wmb.42.1626875395424; 
 Wed, 21 Jul 2021 06:49:55 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id b16sm28467354wrs.51.2021.07.21.06.49.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jul 2021 06:49:55 -0700 (PDT)
Subject: Re: [PATCH] chardev/socket: print a more correct command-line address
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20210721130453.1180878-1-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <f564e517-af52-3426-13c1-230b4d2c09b4@redhat.com>
Date: Wed, 21 Jul 2021 15:49:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210721130453.1180878-1-marcandre.lureau@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.459,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.117, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: pbonzini@redhat.com, berrange@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/21/21 3:04 PM, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Better reflect the command line version of the socket address arguments,
> following the now recommended long-form opt=on syntax.
> 
> Complement/fixes commit 9d902d51 "chardev: do not use short form boolean
> options in non-QemuOpts character device descriptions".
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>  chardev/char-socket.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


