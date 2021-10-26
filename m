Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 692D043B969
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 20:20:50 +0200 (CEST)
Received: from localhost ([::1]:48704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfR45-0006Nx-F9
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 14:20:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfQn3-0003nn-4U
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 14:03:13 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:36665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfQmv-0005jh-Hf
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 14:03:12 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 v1-20020a17090a088100b001a21156830bso2992936pjc.1
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 11:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Il0V5v1hmXs0K8IhUZP739pLAEMjXVWHNVQy9zlCy1s=;
 b=X6I5hGZX/1lUYl3vjWEg/E+Ak+dm8/OCo0wUrAMN9dlk/tfAb6NS5JnjFVow1tX6Tr
 57R+rFe8iK6zPxQ3wKGFhJPtmsm3op6ywNg1MJok/FTIjoKl51pBbWqMeGlxfZoo0N6n
 FLizNaaldynzkv6YlyIehsCXIKlqwEn5bgxokPoBte5r+jALBHnV4SAX7m/3kNyQfNeT
 kxHu8l0CohI1KU0YX2lmg3cNP3Wy7hwe+lm+eiyWCHwkWkGfveJqdgcKEvOKIBj5yzaW
 lnfFtKfrF0DZ+03yJ/x5G1Hp5Rt8sIRxx/4H3hANJc6+nDNVDWkwGabzx08HGrQb2uib
 WIHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Il0V5v1hmXs0K8IhUZP739pLAEMjXVWHNVQy9zlCy1s=;
 b=rKmpbHqKZDtnbWnEZrT/0tjNIEDMv37PeQmuUCxKMm21dcuU+QcqRb6akalB1sb9K4
 CL9x12f/BZMyNN1FHz9k1vcRxZXWF6OfibNo9wwk30Xx/vJ8ezUUzvre51bWQDckM42I
 2UHvTFHjJ4f9SBqjYq0dWOLeeJfYeZAGeUjnIi/uXcrFHGnMn4/rnZPyzR0qk1hYcLvQ
 eO3fIgpRPpKMi9xrMVUSq2nNTM3BK4sydZW7eOjpGKYrpH/PmbNlQth3unwyACFTjyhn
 PPcgbDtto4Jz7VpcHURK/MrRygQyeO3wfkHiRJatHX5xzuNuMl+tcD/WPQ+FJwYBqYeW
 imjA==
X-Gm-Message-State: AOAM532vInndKO0T5iccl5TgGT0+ARx4wlVUtS1VoSJwweFqV4K6qlHQ
 QHcBILcOfndzrx73LKn26N7C3Q==
X-Google-Smtp-Source: ABdhPJzgAEUt44jpt7tUkZ8FZhH2lCJ3G/OLWlb63OgN42fIWpYyNRFniyUBMXsrw9y9OTY+YvkFEg==
X-Received: by 2002:a17:90b:4a8d:: with SMTP id
 lp13mr252003pjb.240.1635271383888; 
 Tue, 26 Oct 2021 11:03:03 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id n14sm19435789pgd.68.2021.10.26.11.03.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Oct 2021 11:03:03 -0700 (PDT)
Subject: Re: [RFC 0/2] tls: add macros for coroutine-safe TLS variables
To: Thomas Huth <thuth@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
References: <20211025140716.166971-1-stefanha@redhat.com>
 <2ca9c094-61e6-54b8-89a8-6dad22514c96@linaro.org>
 <CANCZdfr5TAUYeZaRrm0TM-iEaV+BNwWw_JTUHbcr5QwPWhO0iQ@mail.gmail.com>
 <YXgBArG7wRi+hpMx@stefanha-x1.localdomain>
 <85df7de0-cebb-efe9-d26b-f459a37a6621@linaro.org>
 <YXguEo8UQUX/cRo9@stefanha-x1.localdomain>
 <4b8a5b71-0ec2-7c2c-6929-de303ec29a53@linaro.org>
 <d1bbc5ee-53ba-dce2-9eb8-9320f03e9734@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c7029218-233c-c54c-320a-2477bbd495bf@linaro.org>
Date: Tue, 26 Oct 2021 11:03:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <d1bbc5ee-53ba-dce2-9eb8-9320f03e9734@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.215,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
Cc: fweimer@redhat.com, Kevin Wolf <kwolf@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Fam Zheng <fam@euphon.net>,
 Warner Losh <imp@bsdimp.com>, sguelton@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/26/21 10:26 AM, Thomas Huth wrote:
> Would it maybe make sense to tweak check_patch.pl to forbid __thread in certain folders 
> only, e.g. block/ and util/ (i.e. where we know that there might be code that the 
> iothreads are using)?

This sounds plausible; hw/ too, perhaps.

r~

