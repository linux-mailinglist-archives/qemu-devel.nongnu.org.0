Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 533FB421F16
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 08:51:44 +0200 (CEST)
Received: from localhost ([::1]:60484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXeIh-0005HQ-8Q
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 02:51:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mXeGL-0003oO-Km
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 02:49:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24410)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mXeGI-0004kY-Fa
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 02:49:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633416553;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ITjSriBnRLOZ8BYvpL2bk9EKNf3zTjg+9rrwJ2kQ9hA=;
 b=NUeeGL45QzKnIrCsMDWwHAzPFRQgBmDYEBdfPEZFx4hsO5+LCVWc9P0NrLnmHBHPYqB6Y5
 WKvOZALwuFchGHXpUFt4wms4lDeka9ujeFOaRPg48XiD1OF0nk4rZ2EfTdGtMzqiN6qf4v
 NqAJ/ViOtp6+jjlKhPVmjR7dIZkYBag=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-295-n_Bi_X-VO9Kxr7xrxrbeGA-1; Tue, 05 Oct 2021 02:49:12 -0400
X-MC-Unique: n_Bi_X-VO9Kxr7xrxrbeGA-1
Received: by mail-wm1-f72.google.com with SMTP id
 f12-20020a1c6a0c000000b0030d696e37b7so876522wmc.4
 for <qemu-devel@nongnu.org>; Mon, 04 Oct 2021 23:49:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ITjSriBnRLOZ8BYvpL2bk9EKNf3zTjg+9rrwJ2kQ9hA=;
 b=SltcyzBMu3DMKblihDdug8sJ0l2gWXMJ9bRXdpYZm1OI6LOLOKONxHEENz1kjaaIje
 FZTGRrLKb6y9i7nwVQ8QUuqBYmC4XuWFmmylQbUaD6Fg1y8HN3OtkUs8RFzRUZRCKQCW
 T1NJhliJaPB+0p9aV2nsc1+nPxPFD1a1YiHoBqPCKaMJnHp3fU0J4/COlVgC0fmpQqnO
 ICd8weg45Or+dNHNrHpLM12munyaM8lsd4XpzVyStaVbUdSDeNNHmKYSSgX1lM17qTBu
 53Ldpt7eZAvsToaCqxZ3vc08h4KL9MF+QbgsZodIGzEEzXFv8Sx15NmYTec2DB6071RQ
 +bAw==
X-Gm-Message-State: AOAM530fdYJqDHGY6RAcNLJF9QSJDJOTPGtzXoDmIW17xzmLEZL9ce3c
 YU9IYe3PeZCPim3W4FB2n6RVIsTUh460cMdSYEj7krZ7WbLsv6T5Gmoy0he1V7vHKWh2pucPzkA
 7MiufRbswUllgm7c=
X-Received: by 2002:adf:a745:: with SMTP id e5mr19110360wrd.406.1633416551279; 
 Mon, 04 Oct 2021 23:49:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzVE1l954hvUeYIE4s2YARBeIo4drDcdayZwEoKBUGhm2xhbet65Q8pgr8jGk4Vq2XffPs++w==
X-Received: by 2002:adf:a745:: with SMTP id e5mr19110339wrd.406.1633416551119; 
 Mon, 04 Oct 2021 23:49:11 -0700 (PDT)
Received: from thuth.remote.csb (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id h1sm804401wmb.7.2021.10.04.23.49.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Oct 2021 23:49:10 -0700 (PDT)
Subject: Re: [PATCH] qapi: Make some ObjectTypes depend on the build settings
To: Markus Armbruster <armbru@redhat.com>
References: <20210928160232.432980-1-thuth@redhat.com>
 <c85745b0-d913-5f64-4c08-c2d03542107e@redhat.com>
 <0ddcdd25-55d9-f782-2bc3-a11d7078b337@redhat.com>
 <875yujzk10.fsf@dusky.pond.sub.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <0f17d6c3-73b4-2267-f677-a7156861b3e1@redhat.com>
Date: Tue, 5 Oct 2021 08:49:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <875yujzk10.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 29/09/2021 13.41, Markus Armbruster wrote:
[...]
> In my opinion, use of CONFIG_FOO in QAPI schemata is no worse than using
> them in C type definitions.
> 
> In both cases, we have a choice: compile out stuff this build doesn't
> need with compile-time conditionals, or leave it in unused.
> 
> In C, we sometimes have to compile out stuff, say when it depends on
> headers we don't have.
> 
> In QAPI, we sometimes want to compile out stuff to make introspection
> more useful.  This can be a killer argument.

So what's your opinion on this patch here? Good to go? Needs a rework? Or 
should I simply forget about it?

  Thomas


