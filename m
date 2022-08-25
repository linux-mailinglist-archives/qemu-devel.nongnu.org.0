Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9323B5A193D
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 20:57:50 +0200 (CEST)
Received: from localhost ([::1]:43362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRI33-00072N-6u
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 14:57:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oRI0K-0004l8-MN
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 14:55:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oRI0G-0005Fo-4h
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 14:54:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661453694;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y1LrVrpFuBu3wPfy44NQU2UfAxi+01V/AJmhFSEh5is=;
 b=HIMkJ5YWLq0NfvKoV/t93GDWoKpTJ4rsfruZvy96Ea+8vS4O5IffgEos8ZXjPrhNr/F38p
 LfXfxE2JPjQgcCidT1BqD7rYFhgVUN2WeSESOXj1+vxy3HT5nJ4mfgW2FkCfdTdZlrWd2b
 qDUA9a0pBXzLpiamUDO9fZhwjsJQfWw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-663-4wupZDHKOPa2XudMdmpUJA-1; Thu, 25 Aug 2022 14:54:53 -0400
X-MC-Unique: 4wupZDHKOPa2XudMdmpUJA-1
Received: by mail-wm1-f71.google.com with SMTP id
 j36-20020a05600c1c2400b003a540d88677so11289706wms.1
 for <qemu-devel@nongnu.org>; Thu, 25 Aug 2022 11:54:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=y1LrVrpFuBu3wPfy44NQU2UfAxi+01V/AJmhFSEh5is=;
 b=mNH8abNwXmimnmvmCh0bj4ACNcSBy8sRvx7xS3Y+US/P/EplncJOkTfEUsNtdKCEJy
 +oD8FkX/+9+e8nz2tycmo6S2X9E47jGXN3xjHTcjQCzn71MayyrbJ3ciLi5Z2T8i6kY2
 Eqe69aZPUOekItL5Ro7OYlYF7T7mJBCq0dieR1Xylb4xGgpdHiUm25ahQiAuAHE+bWd5
 +EWWsSB4XP9CrHMpkww7Jk+rJbOVt8oOu1QxKLMlMdlJYdRyy2P6yX4SyDfSiTy7wfsX
 ZX5060fMNqqoK9tCHFvdW28YwfFmNJ/3hM+qNKYB6txbbJtOD9BuwGJnNNuEzVkapV2+
 kBaA==
X-Gm-Message-State: ACgBeo1nqBzyuBZt3Gai6U/x9SbqSl2ox7j8PgxKtxllt1/Tco7IvY0q
 aRmysYBdJ7lHpWh5QNACfMry8AmweC9Xp4aXzDphhMm5Ckem+5jGS4136FwsZk+NcAcrHHwox2c
 72LAVpext9TOLerM=
X-Received: by 2002:a1c:3b04:0:b0:3a5:487c:6240 with SMTP id
 i4-20020a1c3b04000000b003a5487c6240mr9124881wma.152.1661453692567; 
 Thu, 25 Aug 2022 11:54:52 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5Vvc/PLDQCQqy5LZd2lMAPrbOZQGU/zKkrihBEJNF82BUwAXlzZ/GEyb7k5nibeg33nBRSuw==
X-Received: by 2002:a1c:3b04:0:b0:3a5:487c:6240 with SMTP id
 i4-20020a1c3b04000000b003a5487c6240mr9124876wma.152.1661453692290; 
 Thu, 25 Aug 2022 11:54:52 -0700 (PDT)
Received: from [192.168.8.104] (tmo-098-60.customers.d1-online.com.
 [80.187.98.60]) by smtp.gmail.com with ESMTPSA id
 g12-20020adfa48c000000b00224f5bfa890sm21715081wrb.97.2022.08.25.11.54.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Aug 2022 11:54:51 -0700 (PDT)
Message-ID: <9ec3f828-12b6-7e01-ca97-6d9301b96815@redhat.com>
Date: Thu, 25 Aug 2022 20:54:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [RFC PATCH] tests/vm: Remove obsolete Fedora VM test
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
References: <20220822175317.190551-1-thuth@redhat.com>
 <87ilmhh7nd.fsf@linaro.org> <69e48a9d-a343-5cdc-d0fc-6b38fd9d25fd@amsat.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <69e48a9d-a343-5cdc-d0fc-6b38fd9d25fd@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

On 25/08/2022 16.02, Philippe Mathieu-Daudé wrote:
> On 24/8/22 19:29, Alex Bennée wrote:
>>
>> Thomas Huth <thuth@redhat.com> writes:
>>
>>> It's still based on Fedora 30 - which is not supported anymore by QEMU
>>> since years. Seems like nobody is using (and refreshing) this, and it's
>>> easier to test this via a container anyway, so let's remove this now.
>>>
>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>
>> Queued to testing/next, thanks.
> 
> FYI this is the image I'm using to test x86 guest on aarch64/mips64
> hosts, but I can test a BSD-based instead; I suppose Linux as a guest
> is already well tested.

Do you need to compile-test QEMU there? If not, and if you just want to test 
an x86 guest on a non-x86 host, I guess you could use any other x86 Linux 
image, too (even boot a Fedora image directly from the ISO file).

  Thomas


