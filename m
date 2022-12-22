Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1CD653EF0
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Dec 2022 12:19:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8JXC-0007pw-Aj; Thu, 22 Dec 2022 06:14:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p8JWt-0007pX-Pb
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 06:14:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p8JWr-0002ii-Un
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 06:14:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671707665;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v42AR8HYNhBzjTSdF2i52B+gBMYBw6loV9ss9RoV4jQ=;
 b=V7Ew9I4n18Zd2c+Jj2wizX1NMZ8qgquh4CJnAMYZUCwbNlbi6M9JYk49tsZAuu4yBmcxGr
 pnZPesY36QJmdqKBAn/dWDVb3aw5l1mpkBr2ggsRHAcxeyPFl9iQqU99o7CqQJD/Z+mW3U
 0V7Z7tzO0FQJ0DPlimN7c0pbmWSp3g4=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-457-UxI2e7pyNqi9O--R4Zbsjg-1; Thu, 22 Dec 2022 06:14:23 -0500
X-MC-Unique: UxI2e7pyNqi9O--R4Zbsjg-1
Received: by mail-ed1-f70.google.com with SMTP id
 l17-20020a056402255100b00472d2ff0e59so1291934edb.19
 for <qemu-devel@nongnu.org>; Thu, 22 Dec 2022 03:14:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=v42AR8HYNhBzjTSdF2i52B+gBMYBw6loV9ss9RoV4jQ=;
 b=eUQ5VMCELnsotm3l1LIV1nNyGp8eHRhy90T5cb0hMGCRt17NSG+0CMvhX4fkI2SokM
 B2SpAadd98a7H0vT3gfg9WOa7E3j1G6vLP7bhABH7NZiWo7z9c++Pz75bNLdn10+L489
 JOLzuaxc7cuTPoIaCP6cmc4XVEdplhGQK4AH5Sp/qt6Dv8BzYI/q7Bjl2Kxb+NcZxfDO
 YYq9VPMCbt298uSd4YXjqrJHvtn/jYwSUFYQU0xZSn6Lf1gfO1dViIQriomMDOyNPK8d
 zdiNsj5gXdKv9W7n/HGbAr1fwwAlGkTmG42JUUruwF4jCeFKbxA06GvuRRP1J0vaILUd
 UIYg==
X-Gm-Message-State: AFqh2kqGl+AZxAMF7LlYL/nZ7My2Vul76Ih8SzGrM1FWnOIZozs6o0Mh
 mt1pd6RsStOkuYd5UoCQ507SQksz53f70DSaNAO62EBDZjdhLsY5N/nRBS5l5Jcwn2mh1HOD+Z8
 BQd32Y7jIGbKXtfA=
X-Received: by 2002:a17:907:1b0b:b0:7c1:6344:84a with SMTP id
 mp11-20020a1709071b0b00b007c16344084amr6411741ejc.5.1671707662644; 
 Thu, 22 Dec 2022 03:14:22 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvEbeh9viH8FgZJND2C5R489q3L11umfHoGMMC36XHsEN8hMFFs9FzZgw320+MIuhifJoBjuA==
X-Received: by 2002:a17:907:1b0b:b0:7c1:6344:84a with SMTP id
 mp11-20020a1709071b0b00b007c16344084amr6411723ejc.5.1671707662428; 
 Thu, 22 Dec 2022 03:14:22 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 n21-20020a170906725500b007c11f2a3b3dsm131407ejk.107.2022.12.22.03.14.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Dec 2022 03:14:21 -0800 (PST)
Message-ID: <9ca22f9c-5ac7-ebf8-6b91-6dd91d42fe9d@redhat.com>
Date: Thu, 22 Dec 2022 12:14:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3 4/5] coroutine: Split qemu/coroutine-core.h off
 qemu/coroutine.h
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, stefanha@redhat.com, kwolf@redhat.com
References: <20221221131435.3851212-1-armbru@redhat.com>
 <20221221131435.3851212-5-armbru@redhat.com>
 <f6be3b34-acfd-8ac2-1b13-9cff62a8542e@redhat.com>
 <87sfh7g6jv.fsf@pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <87sfh7g6jv.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.148, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 12/22/22 09:56, Markus Armbruster wrote:
>>> +/**
>>> + * Mark a function that executes in coroutine context
>>> + *
>>> + *
>>> + * Functions that execute in coroutine context cannot be called
>>> + * directly from normal functions.  Use @coroutine_fn to mark such
>>> + * functions.  For example:
>>> + *
>>> + *   static void coroutine_fn foo(void) {
>>> + *       ....
>>> + *   }
>>> + *
>>> + * In the future it would be nice to have the compiler or a static
>>> + * checker catch misuse of such functions.  This annotation might make
>>> + * it possible and in the meantime it serves as documentation.
>>> + */
>>> +
>> Is it intentional that "#define coroutine_fn" is not here?
> Yes: I moved it to qemu/osdep.h in PATCH 2, along with its doc comment.
> To avoid compromising coroutine.h as overview documentation, I added
> rephrased documentation there.

Got it.  coroutine.h is not included in the developer documentation so 
that didn't occur to me but I understand it now.

Paolo


