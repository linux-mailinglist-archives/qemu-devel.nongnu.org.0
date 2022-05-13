Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 409C4526375
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 16:10:35 +0200 (CEST)
Received: from localhost ([::1]:39452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npW02-0000rg-Ac
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 10:10:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1npVvv-0007XP-EV
 for qemu-devel@nongnu.org; Fri, 13 May 2022 10:06:21 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:34737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1npVvs-0000WB-4F
 for qemu-devel@nongnu.org; Fri, 13 May 2022 10:06:18 -0400
Received: by mail-ej1-x629.google.com with SMTP id g6so16524086ejw.1
 for <qemu-devel@nongnu.org>; Fri, 13 May 2022 07:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fV0jeyzmQKy7CL9Jnq6wYeRrcmP6NEUtGmomnwwjPOI=;
 b=QiUnDIfe41VT04Avj0L5UDPp5SibXSGaNCFxGq4amfS5t+32j7WIk8MzkpD7XoWYom
 H5lKP1qGGlV2WEYJwbpl3ujtqb9H6OQEo3ab2mzf16ATw2v2ODkcLglvP1Jf/4J2hv09
 aswOG527VUjnkyR7fHO5lRfBuKFMmZEdJfnLU1qUkdPFYQ443o55iaA3XOd4s8jQmm4O
 1p8mvKVn0VVa++i7TD5de3m/oJjBgT95wt7UcreCK4k2/xyRSxWHn2GufB1joyhYoSuC
 eBMDwxsybS+Ynja/WhKe5bxnEneXG61m95Ir2p0BiogVPiQZLG9V5xsi2G+xtTc/SbFJ
 v4SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fV0jeyzmQKy7CL9Jnq6wYeRrcmP6NEUtGmomnwwjPOI=;
 b=NOAYQ8hohs0GGOT1cNd45HACengTG+OnvEplvaq+T7dHhue0gVjgt7qQVpSSDgUoVb
 2I3MClDm7RuYEbUMh4v+GXgQdZy5yEuOaHvBnR2I1+rp0DTDtwuxsx1/la0YmRmoT3z8
 CTpbtuKm57SKqjRnC1wB8kadNdUpznWZfE7aqMknL1AjEuZ5vpCIp5jToAi5QiqWN4pY
 k9Q2ED/MiAbt9IwArmWVQmGRUV2i/1lP+lRG/0vIoIFfWuun+93RtCplJjpsfoSOcQqm
 TRweAlgPyWUJEQccYVibHWm1/6H4X8BgwchF+KbAZ8Rj7ctluAN2nj6R+DugNM2eRvto
 aPlQ==
X-Gm-Message-State: AOAM531pbl6osbig6cUT2+IiWlufNfN7+0/A9JEtN7IPBZ3MmZWuOaag
 HYeypIO3G6Z3cY11CI/F1fI=
X-Google-Smtp-Source: ABdhPJxV6cyZiihE+m2n0PE8j3wSo45deKn1IdsIxgOXnUXKb+P5VER9S07zbGJiylbF6m+Gq9Tmrw==
X-Received: by 2002:a17:907:7e85:b0:6f4:78f1:75b5 with SMTP id
 qb5-20020a1709077e8500b006f478f175b5mr4507513ejc.54.1652450770365; 
 Fri, 13 May 2022 07:06:10 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 gv2-20020a1709072bc200b006f3ef214df5sm815785ejc.91.2022.05.13.07.06.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 May 2022 07:06:09 -0700 (PDT)
Message-ID: <7462f89a-264b-866e-dcdb-6df93499b14a@redhat.com>
Date: Fri, 13 May 2022 16:06:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 1/8] qmp: Support for querying stats
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, dgilbert@redhat.com, berrange@redhat.com,
 Mark Kanda <mark.kanda@oracle.com>
References: <20220511084833.195963-1-pbonzini@redhat.com>
 <20220511084833.195963-2-pbonzini@redhat.com> <87wnepy4qd.fsf@pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <87wnepy4qd.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x629.google.com
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

On 5/13/22 14:52, Markus Armbruster wrote:
>> +# @StatsResult:
>> +#
>> +# @provider: provider for this set of statistics.
>> +# @qom-path: QOM path of the object for which the statistics are returned
> Since @qom-path is optional, we better document when it's present.  In
> the review thread for v1, you explained "Only if the target is vcpus,
> for the current set of targets."  More general, and hopefully still
> correct, would be "Present if that object is a QOM object", but the
> phrasing feels rather clumsy.  Would appending ", if any" suffice?
> 

Alternatively:

# @qom-path: Path to the object for which the statistics are returned,
#            if the object is exposed in the QOM tree

Paolo

