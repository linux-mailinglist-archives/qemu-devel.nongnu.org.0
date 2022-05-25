Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E5B533E4E
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 15:53:30 +0200 (CEST)
Received: from localhost ([::1]:53728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntrS5-0006kg-0O
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 09:53:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ntrOY-0004CR-8g
 for qemu-devel@nongnu.org; Wed, 25 May 2022 09:49:50 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:34762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ntrOW-0004Dc-LA
 for qemu-devel@nongnu.org; Wed, 25 May 2022 09:49:49 -0400
Received: by mail-ej1-x636.google.com with SMTP id q21so21625532ejm.1
 for <qemu-devel@nongnu.org>; Wed, 25 May 2022 06:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=dhVVJJNiGt4HH9joYfV8GIlYf82l8A6la2fDpzonC2g=;
 b=LYFLM1hhkx6zaVln1xlUYfDRZz4T+++MePapEz+w/ZTZFFaU9SINJOakmtnt9PMVLu
 0w6sIVpVFQXdZ4gr8nkFfzBZi+vz/UxIIHTnieqhFP/961hce2rS8YdJJb6hOFzhLjvw
 gBNOYiGjF99SSa2PKgaVJhLMD6CIlgo2e5l3aP2z+L5oQqnAc80aJ8uHSNqp4lo/LPlN
 bJaZOHF6VbfMH36GEpNwssr9nG0GXebDBGQWK2fjV4UsL9KQtG8s4UexlQhsNklL/srX
 uQfXH835HhXwNQD4lfq+EXNI2lLuACyLoJh6Sc0LSdHOEE2KiWyQ9fpYueQDtyt2rkng
 RTQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=dhVVJJNiGt4HH9joYfV8GIlYf82l8A6la2fDpzonC2g=;
 b=6ZW91hx42ac/cgRKgVF4hEwtvO7VOD0v++ZoPgG+MoHiZrkvSuFtBTm/NxD3l6L2MQ
 lfiNcOdfIMqCeWTZL/NL7zw9o2OBmAGRLU6XE62cFxLzo4jpCvPBlYJqdkNJ8+Oj9bv0
 G8YI5XVRwWLjwFZOzZ3MHhTiGQ+/NB1q9uRbDUvBCj0Wboq/lhSLpoQ8ZcoF7URvioDF
 qBhl4hkly8L2kf0Binp1e1y8rLosv0Q9xJIgElmzE2o+olzOPVdYPk58G6YhzJtvs0bK
 9zTfcCTNdna5ZLDgLh8gAGWKMjYrkgfsY2qZbtkCK7/0tyGe6AuEiA8G3g19Jn0eke+9
 100A==
X-Gm-Message-State: AOAM533+x1S9f+4faLFAYeMK9zY7PXW2VAmqfYn/waiIeTl2uYoCQisu
 pgNvtEzvQWV1Wew97F2Ue7dYIxkZaySY0Q==
X-Google-Smtp-Source: ABdhPJx7IibnvQY+PtkYjZizv4OXfZdkvgFfn50+jSiPRWsD8+2odVE+zOGXnywDcEGKuC7Yu2CPTA==
X-Received: by 2002:a17:907:3e9d:b0:6fe:e980:d3de with SMTP id
 hs29-20020a1709073e9d00b006fee980d3demr13663872ejc.586.1653486587107; 
 Wed, 25 May 2022 06:49:47 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 jl11-20020a17090775cb00b006fe98fb9523sm6178108ejc.129.2022.05.25.06.49.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 May 2022 06:49:46 -0700 (PDT)
Message-ID: <9c56b296-f51e-d290-df35-85bc4254cd0f@redhat.com>
Date: Wed, 25 May 2022 15:49:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: Problem running qos-test when building with gcc12 and LTO
Content-Language: en-US
To: Dario Faggioli <dfaggioli@suse.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: Claudio Fontana <Claudio.Fontana@suse.com>,
 "alex.bennee@linaro.org" <alex.bennee@linaro.org>
References: <1d3bbff9e92e7c8a24db9e140dcf3f428c2df103.camel@suse.com>
 <24c61f36e23339cb1ab80b41e906ea60a0d67d2a.camel@suse.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <24c61f36e23339cb1ab80b41e906ea60a0d67d2a.camel@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x636.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 5/24/22 22:12, Dario Faggioli wrote:
> Ok, apparently, v6.2.0 works (with GCC 12 and LTO), while as said
> v7.0.0 doesn't.
> 
> Therefore, I run a bisect, and it pointed at:
> 
> 8dcb404bff6d9147765d7dd3e9c8493372186420
> tests/qtest: enable more vhost-user tests by default
> 
> I've also confirmed that on v7.0.0 with 8dcb404bff6d914 reverted, the
> test actually works.
> 
> As far as downstream packaging is concerned, I'll revert it locally.
> But I'd be happy to help figuring our what is actually going wrong.
> 
> I'll try to dig further. Any idea/suggestion anyone has, feel free.:-)

Does valgrind point out anything suspicious?

Paolo

