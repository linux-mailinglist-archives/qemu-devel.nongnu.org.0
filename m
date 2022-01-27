Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7842749DFBC
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 11:48:15 +0100 (CET)
Received: from localhost ([::1]:35320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD2K6-0000ZY-Am
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 05:48:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nD2HM-0005Xm-6Y
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 05:45:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57989)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nD2HI-00024y-Sm
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 05:45:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643280319;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LU9IZHUu3pCtTqOpPktPpnR6th1g3m239iDevRfSw9Q=;
 b=KM+4i/b9TDLnHRl2pl6oicTt4pLW/dcDOv137X9apqYg3HqObQ9fitVz3U57wHDdA/Kg+c
 PFuadv2IYRQhxztyE3+WEJY+lopGgFCfF9EHYylyCwmIYanSDfcXmJ+fzPQJ1z3UAClKvj
 YCJRYYlI7GhdriNjdEn8uk5upMtC1b0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-371-XXHaU2tdOm2iQ4qlLetxjw-1; Thu, 27 Jan 2022 05:45:15 -0500
X-MC-Unique: XXHaU2tdOm2iQ4qlLetxjw-1
Received: by mail-wr1-f69.google.com with SMTP id
 z1-20020adfbbc1000000b001df54394cebso76695wrg.20
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 02:45:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=LU9IZHUu3pCtTqOpPktPpnR6th1g3m239iDevRfSw9Q=;
 b=nriH3bb/yw6TriAcH6VMhiu4laNZCibP21F1VYEStOcoss7Lo8f9K1cT0lmyv4bURl
 SBVVsuWLuaU6yJs1TB8eL0FrqnfQkhkMn7B3KEdKhYdKV8RNiVq2V1wX/JptPkDkh47A
 wEssI7HytSKyMxzgpfRf/D6ClVSEp1zbdFdUR3gR7d8dg4rQ+zQnitVoYsqnjCsDYE3j
 37W1V1lnswnmJ3nSx5ZcUNLrhKhC+VuGEAAfkuhKiNEbA9ihnOO6usreCXaBi9yohI4k
 Jb2DQNlXFVFzyt+sDWQ9k+ap34HcaVQOqNeSEwb/BSSvnmVHX2kPoD2GRt7eMIwsU9WE
 YDhg==
X-Gm-Message-State: AOAM530+xnK/MOUWJm1Mzj5+cmjwt/fC60WZbYMqy4EdJN21Gb1nzp/p
 cs7MYjs+Fjmz5m7kzf00DzR3Toc/6wtdMh5hhGYJ03nltuDN+UfMseGUxaC02DCnO+0sv6tUHcr
 ljSZK+/i6z7a/vIs=
X-Received: by 2002:a5d:55c3:: with SMTP id i3mr2506449wrw.250.1643280314451; 
 Thu, 27 Jan 2022 02:45:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwbhWQ0cYEvOP9nAWExDN0GxmdfDamScYe4v++JhkcPJg+QDUrNymhc8QXi8IyJQwLs/KH+9A==
X-Received: by 2002:a5d:55c3:: with SMTP id i3mr2506429wrw.250.1643280314175; 
 Thu, 27 Jan 2022 02:45:14 -0800 (PST)
Received: from ?IPV6:2003:cb:c70d:8300:4812:9d4f:6cd8:7f47?
 (p200300cbc70d830048129d4f6cd87f47.dip0.t-ipconnect.de.
 [2003:cb:c70d:8300:4812:9d4f:6cd8:7f47])
 by smtp.gmail.com with ESMTPSA id m14sm2305616wrp.4.2022.01.27.02.45.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jan 2022 02:45:13 -0800 (PST)
Message-ID: <463337d3-dad9-abbc-b0e3-544e08160234@redhat.com>
Date: Thu, 27 Jan 2022 11:45:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH qemu v2] s390x: sck: load into a temporary not into in1
To: Janosch Frank <frankja@linux.ibm.com>, Nico Boehr <nrb@linux.ibm.com>,
 qemu-devel@nongnu.org
References: <20220126084201.774457-1-nrb@linux.ibm.com>
 <a90563ea-2740-d4ca-d2f3-6b6861faf0de@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <a90563ea-2740-d4ca-d2f3-6b6861faf0de@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.159,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: linux-s390@vger.kernel.org, thuth@redhat.com, richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 27.01.22 11:32, Janosch Frank wrote:
> On 1/26/22 09:42, Nico Boehr wrote:
>> We previously loaded into in1, but in1 is not filled during
>> disassembly and hence always zero. This leads to an assertion failure:
>>
>>    qemu-system-s390x: /home/nrb/qemu/include/tcg/tcg.h:654: temp_idx:
>>    Assertion `n >= 0 && n < tcg_ctx->nb_temps' failed.`
>>
>> Instead, use in2_la2_m64a to load from storage into in2 and pass that to
>> the helper, which matches what we already do for SCKC.
>>
>> This fixes the SCK test I sent here under TCG:
>> <https://www.spinics.net/lists/kvm/msg265169.html>
>>
>> Suggested-by: David Hildenbrand <david@redhat.com>
>> Signed-off-by: Nico Boehr <nrb@linux.ibm.com>
> 
> @David: Was this already broken when it was implemented?
> I.e. do we want a "Fixes: 9dc67537 ("s390x/tcg: implement SET CLOCK ")" tag?

That sounds about right.

-- 
Thanks,

David / dhildenb


