Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7555905F7
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 19:37:30 +0200 (CEST)
Received: from localhost ([::1]:49548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMC7d-0000sE-IG
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 13:37:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oMBtK-00045U-Cs
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 13:22:42 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:39930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oMBtH-0001r8-Kz
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 13:22:41 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 h21-20020a17090aa89500b001f31a61b91dso6003991pjq.4
 for <qemu-devel@nongnu.org>; Thu, 11 Aug 2022 10:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=Im9vZhlwVSS5MSHDbabaP7K9a0BEoLwH1rO4LgHCzrk=;
 b=nXIGIeJi+Y8BD86HlNY7IoPKp19aA/zwK1lbKvAO8dnnSc0w+6MX9uDoMA0nfsXleP
 CleeqCZ2dtPgaao1fuaw6b0lehJR/dB5pgAk2JZryPJgew4JBGb2pmePTMbq4yHfxo+x
 eP52/O4TBztZAo7OqqqtFdfF2NstwbDl1MKiP1q+Nj7RGBJGT+wjb04vJRbDluFWXW3m
 yPFlo+CLigd1jTEGvFyuNgaYo9XFP0GEPaUKa17Q3WCLywAY6rkOj8MCmRxIKHkvZjnQ
 QE0d2LGcLys79Rof2gaIO8/AmZQastLPAfvEKc+AJARdAsABa+NMeystEo37RYqeVWqE
 FgPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=Im9vZhlwVSS5MSHDbabaP7K9a0BEoLwH1rO4LgHCzrk=;
 b=XoiuqsGXcOXDqW6+SK5C/4PGn43ePxFRg5p7gPS7rNBsCTS+vNV1nwkNuxk6aSZksm
 kJZgcrhPUBsbqJxg4eKAC7hPteE7W4wNvsTn+UybI1vZiC3wT/RZr/nqthmMqZGfYjEm
 FdxDvUyTUA2XaXsiJscJqGF/xY/WoV83PZyKcrlh8wZ1qPNJcNopuioaf9nka3Q49dg+
 kbvdI2sAvC79OC1e4D4iDkqdzpMCVBckSfU1l48750/km1KXjWKrD8mcFtnMXyneshbD
 IPj03wXXHTdIEuSwjoeR5QLjPiWrjrgU/rGyogQ8pUvji4O2WIIF2idU34wJahb4DfY3
 9Imw==
X-Gm-Message-State: ACgBeo2VnixO3trvs6TDDUef5zFpS0Cdxuz33TCoGs30H4XKQKsQYbNF
 YiktSOWzUiSVAyYpYoqN7Fve9w==
X-Google-Smtp-Source: AA6agR4NJE/Lvf5BbodQ64jlWoYQldrLhsrM7h+F+FYaqPTMNx8cNBOEL0hdjoNgaG+5OpjUW9D5PA==
X-Received: by 2002:a17:902:8302:b0:16d:bf03:847c with SMTP id
 bd2-20020a170902830200b0016dbf03847cmr162736plb.125.1660238557851; 
 Thu, 11 Aug 2022 10:22:37 -0700 (PDT)
Received: from ?IPV6:2602:ae:154e:e201:72e2:2d06:c2b1:b106?
 ([2602:ae:154e:e201:72e2:2d06:c2b1:b106])
 by smtp.gmail.com with ESMTPSA id
 b7-20020a170902d50700b0016f057b88c9sm15229516plg.26.2022.08.11.10.22.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Aug 2022 10:22:36 -0700 (PDT)
Message-ID: <3b0644da-a48d-2ad0-aea1-80f6bfbb1265@linaro.org>
Date: Thu, 11 Aug 2022 10:22:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v4 4/5] target/i386: Make translator stop before the end
 of a page
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: Ilya Leoshkevich <iii@linux.ibm.com>, Laurent Vivier <laurent@vivier.eu>, 
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>
References: <20220811095534.241224-1-iii@linux.ibm.com>
 <20220811095534.241224-5-iii@linux.ibm.com>
 <9d15064f-3580-49a8-596b-019663b084fb@linaro.org>
In-Reply-To: <9d15064f-3580-49a8-596b-019663b084fb@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 8/11/22 09:58, Richard Henderson wrote:
> On 8/11/22 02:55, Ilya Leoshkevich wrote:
>> Right now translator stops right *after* the end of a page, which
>> breaks reporting of fault locations when the last instruction of a
>> multi-insn translation block crosses a page boundary.
>>
>> An implementation, like the one arm and s390x have, would require an
>> i386 length disassembler, which is burdensome to maintain. Another
>> alternative would be to single-step at the end of a guest page, but
>> this may come with a performance impact.
>>
>> Fix by snapshotting disassembly state and restoring it after we figured
>> out we crossed a page boundary. This includes rolling back cc_op
>> updates and emitted ops.
>>
>> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
>> ---
>>   target/i386/tcg/translate.c | 25 ++++++++++++++++++++++++-
>>   1 file changed, 24 insertions(+), 1 deletion(-)
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Also,
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1143


r~

