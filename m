Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D07B3A71DF
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 00:24:47 +0200 (CEST)
Received: from localhost ([::1]:47946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsv0g-0000kE-Ab
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 18:24:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsuyq-00071c-7u
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 18:22:52 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:46994)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsuyn-0004RE-JC
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 18:22:51 -0400
Received: by mail-pf1-x430.google.com with SMTP id x16so7495738pfa.13
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 15:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=mTWlfVlKbg3lS9GTlmCvyRWQO+V09J7F+2Kkce4J+9o=;
 b=DLBV2EswceSFZ320H7bDmbejAkb2IXb+3T225GyWbwZEpcH7Z1IIfP5B8T3WbuBprT
 fdOYR4fJoVJbBLAKSo8HKbiOgPaUbnsJpkylnpLpkAc9GbpjGIa8vZBdmTyuKwf1/aQq
 7tEiTqE+biMaWG7HrFLhgFI09p1grFwFsNLNxWATzWPzUk3MHDil79vDvh7DEbj+RwkU
 ny0mrB1MZcIgTVbhGCZ5vsLr+vmQVMqxduqJ2cIl9KCbGsoZNYzAKuat7gQNu2OgWgQl
 CEol4ZBpv3lDidyypNG3Z3Gebpnhj+hcI7JarNhvNWtRsoPnwhkBsCrwBEPXZlysHWKL
 gjxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mTWlfVlKbg3lS9GTlmCvyRWQO+V09J7F+2Kkce4J+9o=;
 b=LLA0qYd3MGtJw9j6vFDle+v+oZFxlCm/OYCLXWRqgPy1Clb0yYKAAZ4tL+rG/cMPrd
 43jeqtr3TUUVd8LztDC5BXpFxDO8ZAqRn62usgeKWUckLDuuaibn/+TnCzDY2LeHce/Y
 XfW7mqBuf5U7rTi23O5mIeg9eFmQfdXok5ztk90PPaSYqZwkVBHdhTof2XfuH5PLYeAm
 RS3cwblORaGos2tTmbzG5KXJfrku3PKdTZu6QXJgTXc6k31OpQQQ1gvMB6keoX8oUtBu
 zOB1zc1UV4WjwGvyYXi8ZPc+YcOuYY3CdkgUpaUiBWsrinrHHecDjwl6ORNm3F4xRV0S
 OUXg==
X-Gm-Message-State: AOAM533b1x1fQ03sB30FNDOvLn7coD+kSRaghEI0867whEDc9veOalWZ
 LV/sW8V9Cg+CvuRMLbF6myNbEgbvySVD9A==
X-Google-Smtp-Source: ABdhPJwwhe6PQfybwTLr+fjaZgieZpiWkPoYst+4k/jL0qi0pQfWvz730nqVF5XQN/O3kpmoG3moMA==
X-Received: by 2002:aa7:8058:0:b029:2e9:ee0e:b106 with SMTP id
 y24-20020aa780580000b02902e9ee0eb106mr1214245pfm.4.1623709367955; 
 Mon, 14 Jun 2021 15:22:47 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 d6sm1423556pgq.88.2021.06.14.15.22.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jun 2021 15:22:47 -0700 (PDT)
Subject: Re: [PATCH v2 00/57] target/arm: First slice of MVE implementation
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210614151007.4545-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2ded6216-9fa3-2b39-87ac-c61d08e80fd7@linaro.org>
Date: Mon, 14 Jun 2021 15:22:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210614151007.4545-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.489,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/14/21 8:09 AM, Peter Maydell wrote:
>      - pass only ESIZE, not H, to macros in mve_helper.c

I've been thinking about the H* macros again while reading this.

While H##ESIZE is an improvement over passing in HN, I think we can do better and force 
the adjustment to match the type -- completely avoiding bugs you've caught at least twice 
during SVE review.

The form I'm playing with today is

#ifdef HOST_WORDS_BIGENDIAN
#define HTADJ(p) (7 >> __builtin_ctz(sizeof(*(p))))
#define HBADJ(p) (7 & (7 << __builtin_ctz(sizeof(*(p)))))
#else
#define HTADJ(p) 0
#define HBADJ(p) 0
#endif

/**
  * HT: adjust Host addressing by Type
  * @p: data pointer
  * @i: array index
  *
  * Adjust p[i] for host-endian addressing of sub-quadword values.
  */
#define HT(p, i)  ((p)[(i) ^ HADJ(p)])

/**
  * HB: adjust Host addressing by Bype
  * @p: data pointer
  * @i: byte offset
  *
  * Adjust p[i / sizeof(*p)] for host-endian addressing
  * of sub-quadword values.  Unlike HT, @i is not an array
  * index but a byte offset.
  */
#define HB(p, i) (*(__typeof(p))((uintptr_t)(p) + ((i) ^ H1ADJ(p))))

void bt(unsigned char  *x, long i) { H(x, i) = 0; }
void ht(unsigned short *x, long i) { H(x, i) = 0; }
void wt(unsigned int   *x, long i) { H(x, i) = 0; }
void qt(unsigned long  *x, long i) { H(x, i) = 0; }

void bb(unsigned char  *x, long i) { H1(x, i) = 0; }
void hb(unsigned short *x, long i) { H1(x, i) = 0; }
void wb(unsigned int   *x, long i) { H1(x, i) = 0; }
void qb(unsigned long  *x, long i) { H1(x, i) = 0; }

This gives us

#define DO_1OP(OP, TYPE, FN)                                            \
     void HELPER(mve_##OP)(CPUARMState *env, void *vd, void *vm)         \
     {                                                                   \
         TYPE *d = vd, *m = vm;                                          \
         uint16_t mask = mve_element_mask(env);                          \
         unsigned e;                                                     \
         unsigned const esize = sizeof(TYPE);                            \
         for (e = 0; e < 16 / esize; e++, mask >>= esize) {              \
             mergemask(&HT(d, e), FN(HT(m, e)]), mask);                  \
         }                                                               \
         mve_advance_vpt(env);                                           \
     }

Thoughts?  Especially on the naming of the macros?
If the idea appeals, I'll do a pass over the existing code.


r~

