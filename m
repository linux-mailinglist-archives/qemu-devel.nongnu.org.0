Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB0160FC6D
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 17:54:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo5Cg-00087B-KK; Thu, 27 Oct 2022 11:53:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oo5Ce-0007zr-BB
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 11:53:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oo5Cb-0002SH-Jv
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 11:53:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666886032;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v5U/cHaH2xx/U4HzSsSjRnl5nNaLx3HyEsr7YlFbybk=;
 b=bYVL1Sb2lJsWmrww6GSgOsPpIYmQjxlM/jTIoweIyWe/vMOQUcHuXRJYoSu23Lb7z48PiR
 Vicbh5JI0x6pdSx56rHfct46IT1T20XVmB00PG0QkkgxisVaQh//yHfAGKDEardZqvxVWl
 kglkKHsqCiu9IOrQfzFfrDdYlN61Guo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-427-fKn_V2qHNOGToGYe9rgWdg-1; Thu, 27 Oct 2022 11:53:50 -0400
X-MC-Unique: fKn_V2qHNOGToGYe9rgWdg-1
Received: by mail-wr1-f72.google.com with SMTP id
 d10-20020adfa34a000000b00236616a168bso580238wrb.18
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 08:53:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=v5U/cHaH2xx/U4HzSsSjRnl5nNaLx3HyEsr7YlFbybk=;
 b=6+9rMND7Km5M58aKddneXYVQSNdaXjVUjTh8JQIpxVfYO9P3kKUUPXEftV8pRq81no
 NFxbwi8sLR+kYlRswS+SX3Y8WmXI6vX9ZLicy2iLUCv9ka9v8zL5tFqgWU/Sy90H7SoC
 TPoEPy9/3Ta9Ae/Uod7I0liKEMyNzPacqh/qAcxGrUKsRWOTjIl5/xqX0uJM/q9WWuyW
 CoceCNiwK++UF6ve1cOXU3VmYrhmG5aqc5LYpwpl6HPBLKP3+60eLrDwZtMOLMqIV5Rw
 I6i7f9ttTtbjlVjyJLjJI+sZ4Z/jR2WdSp2Zta70WCo5OzIUrZ7VX8XQg8Cq2CJuTra/
 eeDQ==
X-Gm-Message-State: ACrzQf1oIsABDh2xIiwWePyWKTqLPclhncUZQcUoTbuHknGHTSX68ReB
 IEiAhe75ZusFiT8La+dJFBOUCn28VDeG2xi5Sa3NLxvoF2/K8T5VT7rSPUVbVgsvXNjWG8esR5a
 i/2uqZQTkcNt9Akk=
X-Received: by 2002:a05:600c:3787:b0:3c6:f85c:ebfe with SMTP id
 o7-20020a05600c378700b003c6f85cebfemr6588967wmr.105.1666886029727; 
 Thu, 27 Oct 2022 08:53:49 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5Fa445jnrqd20TJ2NFJ5rdTq1B7/LsUhd/W3Rh4vJuBpv52PpzgM6g+XC0JRvI/efPCcjYZQ==
X-Received: by 2002:a05:600c:3787:b0:3c6:f85c:ebfe with SMTP id
 o7-20020a05600c378700b003c6f85cebfemr6588958wmr.105.1666886029487; 
 Thu, 27 Oct 2022 08:53:49 -0700 (PDT)
Received: from [192.168.8.100] (tmo-066-116.customers.d1-online.com.
 [80.187.66.116]) by smtp.gmail.com with ESMTPSA id
 l15-20020a05600c4f0f00b003cf4c1e211fsm2069041wmq.38.2022.10.27.08.53.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Oct 2022 08:53:49 -0700 (PDT)
Message-ID: <4ad773a9-2173-3667-47f8-2713efffa053@redhat.com>
Date: Thu, 27 Oct 2022 17:53:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PULL 00/23] 9p queue 2022-10-24
Content-Language: en-US
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>
Cc: Greg Kurz <groug@kaod.org>, Linus Heckemann <git@sphalerite.org>,
 Bin Meng <bin.meng@windriver.com>
References: <cover.1666608862.git.qemu_oss@crudebyte.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <cover.1666608862.git.qemu_oss@crudebyte.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
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

On 24/10/2022 12.54, Christian Schoenebeck wrote:
> The following changes since commit 0529245488865038344d64fff7ee05864d3d17f6:
> 
>    Merge tag 'pull-target-arm-20221020' of https://git.linaro.org/people/pmaydell/qemu-arm into staging (2022-10-20 14:36:12 -0400)
> 
> are available in the Git repository at:
> 
>    https://github.com/cschoenebeck/qemu.git tags/pull-9p-20221024
> 
> for you to fetch changes up to 3ce77865bf813f313cf79c00fd951bfc95a50165:
> 
>    tests/9p: remove unnecessary g_strdup() calls (2022-10-24 12:24:32 +0200)
> 
> ----------------------------------------------------------------
> 9pfs: performance, Windows host prep, tests restructure
> 
> * Highlight of this PR is Linus Heckemann's GHashTable patch which
>    brings massive general performance improvements of 9p server
>    somewhere between factor 6 .. 12.
> 
> * Bin Meng's g_mkdir patch is a preparatory patch for upcoming
>    Windows host support of 9p server.
> 
> * The rest of the patches in this PR are 9p test code restructuring
>    and refactoring changes to improve readability and to ease
>    maintenance of 9p test code on the long-term.

  Hi Christian,

I think this PR broke the FreeBSD CI jobs:

  https://gitlab.com/qemu-project/qemu/-/jobs/3219611457#L3116

  https://gitlab.com/qemu-project/qemu/-/jobs/3219611460#L3372

Could you please have a look?

  Thanks!
   Thomas



