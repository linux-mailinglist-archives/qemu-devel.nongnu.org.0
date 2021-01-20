Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD552FD3E4
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 16:28:23 +0100 (CET)
Received: from localhost ([::1]:38596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2FPC-0003Yb-Cl
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 10:28:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l2FJ6-00044p-L8
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 10:22:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24226)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l2FJ5-0000RV-2v
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 10:22:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611156122;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fsbFhwgPR1GTfU7croCJ5gQ+d+803aYlik+uB8GH3bQ=;
 b=VnzYewfJ9bBnINWnLakGMeQIko8PV8goksme3vh7+T75VQuxGPKjM6zulxuY5lQftCp7e7
 0Rv3BULBfESkQfrnv2kPc3lGuZAJ7crKmu6+uaEPjkr7qDI7/jTN8Aj5Yisalr8Zxcyrhw
 pgJQmAb0yLwNPPws2jVtDMMVLX03WcY=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-4vZxk8d3NieSIlVNx26V3Q-1; Wed, 20 Jan 2021 10:22:00 -0500
X-MC-Unique: 4vZxk8d3NieSIlVNx26V3Q-1
Received: by mail-ej1-f72.google.com with SMTP id jg11so7017103ejc.23
 for <qemu-devel@nongnu.org>; Wed, 20 Jan 2021 07:22:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fsbFhwgPR1GTfU7croCJ5gQ+d+803aYlik+uB8GH3bQ=;
 b=Rup4oyzwZ2dLdwAlCfTWK7O/X7SVEUMyAJSbeMQ+ZZ5iUvZiyah4Rvv2+TMbWKoDCG
 w98d3jZHRzvZu36CQthGCGGn2eZK91udjMGjDhLijfeaKPOk08Bqmg+r3tHRK1CONvd/
 flki1PmhA4y/29ems20EK0HKkarCSkFH8wsdYja1vCq6m5u/P/XkFLswlgBsGG3XgAAT
 9Rv+NTDA4/2F/PhJ2h5A6Hrv1MCSrFii6FU+Eq7Fx/bb61vAy5TM5d36aXbl2wtd6fZg
 ylFFtVubnAEzMoR9VukIBAUaHabAWCSUQyXRrGKzkVVYFx7We7QfJIsZAPLwfhL9p72f
 C6TQ==
X-Gm-Message-State: AOAM532V+ENLKotYBpKIrtb7/1+szSsTmygWc4JB9SYDR9MSEUZCo+dE
 hK6gqD4J+lzsOiYEEKoATMbF0NDX+XwK26SbSVADNVtTEbQErAC4PYZ8c+rHPg3cGGdqruKHRjE
 LYypxqbWNTcUB8pQ=
X-Received: by 2002:a05:6402:2694:: with SMTP id
 w20mr7769245edd.200.1611156119600; 
 Wed, 20 Jan 2021 07:21:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwaTCuq4HcZg4XuSurSBvoq7vjqMzi/rmrMJ0h+Y/N1QRuh48xD2YxMLOy8m0teQr8Q74CY5g==
X-Received: by 2002:a05:6402:2694:: with SMTP id
 w20mr7769233edd.200.1611156119457; 
 Wed, 20 Jan 2021 07:21:59 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id gj9sm337214ejb.107.2021.01.20.07.21.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Jan 2021 07:21:58 -0800 (PST)
Subject: Re: [PATCH 2/3] qmp: remove deprecated "change" command
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210120144235.345983-1-pbonzini@redhat.com>
 <20210120144235.345983-3-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <3141cc58-f010-081d-be76-214531bfbb6d@redhat.com>
Date: Wed, 20 Jan 2021 16:21:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210120144235.345983-3-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.094, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: armbru@redhat.com, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/20/21 3:42 PM, Paolo Bonzini wrote:
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  docs/system/deprecated.rst       |  5 ----
>  docs/system/removed-features.rst |  5 ++++
>  monitor/qmp-cmds.c               | 51 --------------------------------
>  qapi/misc.json                   | 49 ------------------------------
>  4 files changed, 5 insertions(+), 105 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


