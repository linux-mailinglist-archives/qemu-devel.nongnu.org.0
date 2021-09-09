Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A4F040458A
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 08:18:01 +0200 (CEST)
Received: from localhost ([::1]:42684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mODNm-0004EH-EW
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 02:17:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mODLG-00024F-MX
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 02:15:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49232)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mODLC-0004py-KN
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 02:15:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631168110;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d+JsT1VPp+EjxdnL8OW+xzJIybUgBU2kDiRiRqVeWHA=;
 b=ZJHelCvpEHTanB+KXm7WFkBttki5BvzU91DnWr3Uz2i32KRvN+2TBEeKyO5q27L18L5lMN
 +t/VRYrNIcO6t5BoVXhGGgR9UhIlc+V8bVVl3fIZ68hnRoTrykY/X9bsFGYRNYz6loJgEN
 fbvqUJ5nD1E1SdYODJavW0tmCsMNgW4=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-26-D5aiCkFRMJ6zEuUbz1D4qA-1; Thu, 09 Sep 2021 02:15:10 -0400
X-MC-Unique: D5aiCkFRMJ6zEuUbz1D4qA-1
Received: by mail-ej1-f69.google.com with SMTP id
 ga42-20020a1709070c2a00b005dc8c1cc3a1so261411ejc.17
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 23:15:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=d+JsT1VPp+EjxdnL8OW+xzJIybUgBU2kDiRiRqVeWHA=;
 b=fdd2sTBRMCaG85DXLNWPQB4DfZu7l7hP6vkPgXeORqvztLtllZn5p8kB0Zk+XT8Bln
 Vr2fN+6A5deu85kdQ6q46jYQo2m7OF7GHjCLGN0m5DIl5dMI+uUgu74DTY9YBYCjs+mQ
 wvmGHyEbtobQRIonds+Zk3dET8KCQr0mKDcIXI6b8JRA1J2qtAgoicw0qxmxoLQ//Sor
 JU5fk9K184u2rvdESH0Ryga4sWLqFnMY1ufCXtNpbFntpGqcVzwbmaJHhTOyzMfX28a6
 MsesCdQHJYU99KKLt8RNShXGvtg12NAXXCXB3uhMWXC2r/EW98NGdvCM3zhJzygmjnfd
 JLMg==
X-Gm-Message-State: AOAM531hIPeprWTdZmRNidlXK0joZZpZE4CYJE6CKkXSof46JVKOZ+hG
 K3GvGj2bL0Z7SrqEezPBFiZ5oiXVcTc2tU2IiOcAoXN1lfvhzKXorq7ccykWYsltGe3/EAoIwGb
 tNoXdmr4BrEtNlDk=
X-Received: by 2002:a50:9b06:: with SMTP id o6mr1477569edi.284.1631168108837; 
 Wed, 08 Sep 2021 23:15:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzNtqqnyNymElG8NAi/1gs1gLW43JlerUrIlT7F0pJVTjgdjs8yIewU3s1+JNZCyy/F5GxN3g==
X-Received: by 2002:a50:9b06:: with SMTP id o6mr1477549edi.284.1631168108614; 
 Wed, 08 Sep 2021 23:15:08 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id di4sm32848edb.34.2021.09.08.23.15.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Sep 2021 23:15:08 -0700 (PDT)
Subject: Re: [PATCH 0/5] Stop adding HMP-only commands, allow QMP for all
To: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210908103711.683940-1-berrange@redhat.com>
 <875yvbrtnq.fsf@dusky.pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <f50c519c-9fe7-bf04-84c5-f4abc2b9227d@redhat.com>
Date: Thu, 9 Sep 2021 08:15:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <875yvbrtnq.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.922, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Eric Blake <eblake@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08/09/21 17:09, Markus Armbruster wrote:
> This is 77 out of 170 HMP commands.  I was hoping for fewer.

There are several that are not quite 1:1, but still not HMP-specific.

>      exit_preconfig

This is x-exit-preconfig.

>      migrate_set_capability
>      migrate_set_parameter

These are migrate-set-{capabilities,parameters}

>      mouse_button
>      mouse_move
>      mouse_set
>      sendkey

These are input-send-event, but they are not implemented in terms of it.

>      nmi

This is inject-nmi.

>      loadvm
>      savevm

These are snapshot-{load,save}.

>      watchdog_action

This is set-action, but it is not implemented in terms of it.

Paolo

>>                                          and then perhaps have
>> a task to track their conversion to QMP. This could possibly
>> be a useful task for newbies if we make it clear that they
>> wouldn't be required to undertake complex QAPI modelling in
>> doing this conversion.
> 
> Yes.
> 
> Thanks for tackling this!
> 
> 


