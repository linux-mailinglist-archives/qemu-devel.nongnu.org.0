Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B361C5A2FF0
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 21:29:10 +0200 (CEST)
Received: from localhost ([::1]:35668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRf0v-0004Ub-C3
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 15:29:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oRezf-00039C-3b
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 15:27:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32386)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oReza-0005qT-N6
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 15:27:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661542064;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jd+jvsMv2JQhBOxF7xX0DRShkASPLPBhA3wTYqYOmt0=;
 b=GP35ws6Umy6wWovO2xu/OfFo5RWDi7mgbQ08uj6qtYcE3BuZShEI+DV0/4uhSLGt4Xm0Pi
 8BVxfuvJMvZdXdn/UBj+dZkCso5Wkdrl43yQ09R+0L1I2j2oi9UAdAm9b1pikMdfEfkSHk
 xWa5etCG+i0b2KQ2Qi2pPNh9MFZlSEo=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-615-F4hEGkRYM56d8RqtdKfDNA-1; Fri, 26 Aug 2022 15:27:42 -0400
X-MC-Unique: F4hEGkRYM56d8RqtdKfDNA-1
Received: by mail-wr1-f70.google.com with SMTP id
 h21-20020adfaa95000000b002252a5b0917so290722wrc.9
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 12:27:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=Jd+jvsMv2JQhBOxF7xX0DRShkASPLPBhA3wTYqYOmt0=;
 b=bhg+mba//N+7ImxPmb/zIguWjBX0Uf0eUc55U5bdsdBLlE4U5+wJJ+7y+DqtHkbq0D
 DBHbUFERJzjBp1oo5ApUZXyWlnfNvutj1hyqBu5QFMtwHNGGUXZ4ccuwgYuHJ6pf3mzw
 mJThqw36Gdau1e0jPMvqQhaBD0SXVxPQgZT/AU6cPgR5mbrDG836xfi+8OdNEnljTsOv
 9wLi7FhhSkTyn77z4I9rlEClEOhz2QlbSRyrBU6DdrFgnFbpo8OohvJ+GfU8bnECif+W
 JVTmqQh8beXRu+QELZplE8c9V6FiOnF6h+/64bDrX4GkGyanczUYLhz183bGFGqd8f7c
 kZ0A==
X-Gm-Message-State: ACgBeo0SBKmb6q6QXmJH5V8L1CvKMU1rYzc2uc2bY2IL2LoEZ6gKqEkB
 OSI1ooZU/5vW8yR2k7kLc+KthLzZdb6b/t5AmEjHIq9XlsbSQSnAByg5I5p+RNjnFw0KLpdaLqr
 N5TcTTE4P41W/x/s=
X-Received: by 2002:a5d:64ce:0:b0:225:7d21:e02a with SMTP id
 f14-20020a5d64ce000000b002257d21e02amr584683wri.99.1661542061568; 
 Fri, 26 Aug 2022 12:27:41 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4f6cTYTZjfXy6UK/MJzuBCov+XOoTmjacschWerKXjKjFGiKQVPhE73muEG8qWcQ5byKxq4w==
X-Received: by 2002:a5d:64ce:0:b0:225:7d21:e02a with SMTP id
 f14-20020a5d64ce000000b002257d21e02amr584667wri.99.1661542061367; 
 Fri, 26 Aug 2022 12:27:41 -0700 (PDT)
Received: from [192.168.8.104] (tmo-098-60.customers.d1-online.com.
 [80.187.98.60]) by smtp.gmail.com with ESMTPSA id
 m2-20020a7bca42000000b003a5dbdea6a8sm487180wml.27.2022.08.26.12.27.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Aug 2022 12:27:40 -0700 (PDT)
Message-ID: <1cea6182-7327-dc57-8f2c-801798b32441@redhat.com>
Date: Fri, 26 Aug 2022 21:27:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v1 01/25] tests/avocado: split the AST2x00Machine classes
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20220826172128.353798-1-alex.bennee@linaro.org>
 <20220826172128.353798-2-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220826172128.353798-2-alex.bennee@linaro.org>
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

On 26/08/2022 19.21, Alex Bennée wrote:
> The SDK tests take a lot longer to run and hence need a longer
> timeout. As they run well over the 60 second maximum for CI lets also
> disable them for CI as well.
> 
> I suspect they also suffer from the inability to detect the login
> prompt due to no newlines being processed.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/avocado/machine_aspeed.py | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)


Reviewed-by: Thomas Huth <thuth@redhat.com>


