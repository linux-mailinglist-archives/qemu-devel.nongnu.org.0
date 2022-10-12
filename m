Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F585FCB91
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 21:27:21 +0200 (CEST)
Received: from localhost ([::1]:41032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oihNw-0005Ue-8m
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 15:27:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oihKe-0000m1-3F
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 15:23:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oihKc-0002Pl-MR
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 15:23:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665602634;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sTDkzUxJk0emOO3l/3R+AyO2suIBQbgHRuYYcM5jT5w=;
 b=LS777irGZWTvANL0G4bajvAKgOlcjx1XluoeNbYrz9j9/Rhs6tHo+eEew9aHNjVTZxvYno
 DABuDxJMji5Gjy8S35Fid3m+Fmm3vsgcSv9YWBSa2PNp+saXERw7f8Y0vtSDyQ+a/KnvBU
 PDrdcGwtg6kdHANaeIMcB+IycP45vyk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-175-JhTBnKNIOtCvhstycIiz4Q-1; Wed, 12 Oct 2022 15:23:52 -0400
X-MC-Unique: JhTBnKNIOtCvhstycIiz4Q-1
Received: by mail-wm1-f70.google.com with SMTP id
 g8-20020a05600c4ec800b003b4bcbdb63cso10450796wmq.7
 for <qemu-devel@nongnu.org>; Wed, 12 Oct 2022 12:23:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sTDkzUxJk0emOO3l/3R+AyO2suIBQbgHRuYYcM5jT5w=;
 b=b+K2KYR+g4OaFAXWf46wmDp6ZltMjlweeuosTnxeCbyxNz7f+OuiljPmechSnO62qV
 mKxY6EOmpDG2NkVkpsxrP2MCUH5BPG6fPGQB+F0LwiLh/Uo8Es2SsVXOOejEpjpaPDuu
 9eWXnylbmpnTMwyPixhbsMprwofBDqVWAntSek6VbB4+f2u30WJHSBa4oU05f4qlAHAz
 VpENK3QcsMQNZEp1tDXYOZe56f75fuqdBT/gSdeZaB1w0SPZuw7eeMd3FbqpJwGh32cH
 Ipm+3jDybm50CVauu6q45UMFXNFF1S0nWnUspa6+yRTF9P2ve04F47cldiDO1C4RHNR6
 umfw==
X-Gm-Message-State: ACrzQf3ksfD+WA2GyNkWHZ6NlkH7Brj2he0rfWSmR+65gtYV9MziWDPE
 z82jcKWYe5XjdNpsTwSjerJxIEl4x9xZw3i42heVW0/NruVhVgDdJPZU9U+WRSRtUkHZqviLIAC
 3yOFz6oNE95TRBus=
X-Received: by 2002:adf:e60d:0:b0:22c:d483:5ee1 with SMTP id
 p13-20020adfe60d000000b0022cd4835ee1mr18670861wrm.641.1665602631324; 
 Wed, 12 Oct 2022 12:23:51 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM47cQOT7pgdVHzf8Ui6LB7Mf12pGK7RtAeg+X+dMHf1Hrlv4tL8ETAfysppL+QIB1tuVwgy1Q==
X-Received: by 2002:adf:e60d:0:b0:22c:d483:5ee1 with SMTP id
 p13-20020adfe60d000000b0022cd4835ee1mr18670850wrm.641.1665602631045; 
 Wed, 12 Oct 2022 12:23:51 -0700 (PDT)
Received: from ?IPV6:2003:cb:c713:fd00:9f9b:c2f8:47fc:4836?
 (p200300cbc713fd009f9bc2f847fc4836.dip0.t-ipconnect.de.
 [2003:cb:c713:fd00:9f9b:c2f8:47fc:4836])
 by smtp.gmail.com with ESMTPSA id
 m19-20020adfc593000000b00226dedf1ab7sm414666wrg.76.2022.10.12.12.23.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Oct 2022 12:23:50 -0700 (PDT)
Message-ID: <748632ec-bac0-6353-eef6-ab53ca155efc@redhat.com>
Date: Wed, 12 Oct 2022 21:23:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 3/3] tests/tcg/s390x: Add a test for the vistr instruction
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
References: <20221012182755.1014853-1-thuth@redhat.com>
 <20221012182755.1014853-4-thuth@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20221012182755.1014853-4-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.528, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 12.10.22 20:27, Thomas Huth wrote:
> This test can be used to verify that the change in the previous
> commit is indeed fixing the problem with the M3 vs. M4 field
> mixup.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


