Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B4B526697
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 17:53:18 +0200 (CEST)
Received: from localhost ([::1]:35426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npXbR-0001Qt-89
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 11:53:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1npXZG-0007oR-76
 for qemu-devel@nongnu.org; Fri, 13 May 2022 11:51:02 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:43864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1npXZD-00014m-6d
 for qemu-devel@nongnu.org; Fri, 13 May 2022 11:51:01 -0400
Received: by mail-ej1-x62f.google.com with SMTP id m20so17020693ejj.10
 for <qemu-devel@nongnu.org>; Fri, 13 May 2022 08:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=x13hY3ZhorkB8Di6lvuhk1D1Pq5eTM90/+R1uOvaW8M=;
 b=ffXOjq9vob8aaqoLchFFJyxFbY+EXNqcFx3UQelmLi7oz/7QfmijQbxFPTau591ZtN
 qkb3U68ZG4LMOlEztjy3ypcnxd78JG4CJGPT2zEGb526qcvFVWgCAEu9ckaQI2fmSgzu
 sLMtNPXaUvVtYkJO4djhtxXurN3L4vyfeiCiUjSPMLDtoq341OMXBZ1QHL/rE/T+b3f0
 veuscK8R7LSioCcFfCAIxYLT+uB8+NeI2UlF0lqISVP2ooPwiMaMHtychnAeczIie9iq
 sdJ5ZKNAtUV266dU83uk5nq3CDmpUUVVKwfcRiOvmn6S4rL7EYpfPSvTwNeoEId40Hez
 qyyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=x13hY3ZhorkB8Di6lvuhk1D1Pq5eTM90/+R1uOvaW8M=;
 b=DjHobmk8leiRI1j/xSvuR8Z/LNVv+P/PcqALpZym7XXHGAquIiCCed37Dm5G+ohYvn
 tguILZ7rDtgYfO4yLy4ZT6/Tqj8QHmsAuGwI4JAhhKu7SV+XlTghdvxhsr4WtRFLLwxq
 lTFLddBflO/SgUy792x8D0U10Qejbbn9Qd8ybemS59s940mhvdOab8ws61W19MhNV8r1
 ZXuP17bVPHQm8gXtrU0Q+J+va/mvow0cC+zxc0HV1uWiBcC8X2jVZmji4u4uYSExe7LE
 XgLkGQmLU5OAa/Iu/E3l+ml8MEFOOhADlZGNmlnnkz+yo7nwUiLyymqJk79476qfe9Tm
 rLvw==
X-Gm-Message-State: AOAM531X8wBfZxv50HTPVbOWl2piE2BwWPsIAm7ytFkbthrV/+9d6UJa
 Ix9RNyZC8Ds3KSDsuGQhClw=
X-Google-Smtp-Source: ABdhPJwKUt3fv/ZvtODxRsY1WurI+SR9AJmyq7q5bmmlLNwcsDma7G8EqVBJJ551yf+99Wxxm2lqXA==
X-Received: by 2002:a17:906:9b92:b0:6fd:e4ce:e416 with SMTP id
 dd18-20020a1709069b9200b006fde4cee416mr4968953ejc.394.1652457051724; 
 Fri, 13 May 2022 08:50:51 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 j18-20020aa7c412000000b0042617ba63b8sm1090783edq.66.2022.05.13.08.50.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 May 2022 08:50:51 -0700 (PDT)
Message-ID: <8bebcd75-61bd-d3aa-974b-eab9f62ae5e5@redhat.com>
Date: Fri, 13 May 2022 17:50:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 1/8] qmp: Support for querying stats
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, mark.kanda@oracle.com, berrange@redhat.com,
 dgilbert@redhat.com
References: <20220426141619.304611-1-pbonzini@redhat.com>
 <20220426141619.304611-2-pbonzini@redhat.com> <87sfpp3018.fsf@pond.sub.org>
 <41B27AED-A9E0-4666-AEBB-0F3C9F436DF1@redhat.com>
 <87v8ukt8g8.fsf@pond.sub.org>
 <e7056663-6f22-e0ec-679a-3f474df05788@redhat.com>
 <87ee0xy3w0.fsf@pond.sub.org>
 <51586997-467c-0209-7319-fc82e1796809@redhat.com>
 <87y1z5v6te.fsf@pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <87y1z5v6te.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62f.google.com
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

On 5/13/22 16:35, Markus Armbruster wrote:
> Friday afternoon, worst time for word-smithing...  Feel free to ask
> again on Monday:)
> 
>> a suggested place?  For example, do you think it would fit better in the
>> query-stats or query-stats-schemas documentation?

I think query-stats-schemas is good enough.

# *Note*: While QEMU and other providers of runtime-collected statistics
# will try to keep the set of available data stable, together with their
# names, it is impossible to provide a full guarantee.  For example, if
# the same value is being tracked with different names on different
# architectures or by different providers, one of them might be renamed.
# A statistic might go away if an algorithm is changed or some code is
# removed; changing a default might cause previously useful statistics
# to always report 0.  Such changes fall outside QEMU's usual deprecation
# policies (also because statistics might be sourced externally, e.g.
# from Linux).  However, they are expected to be rare.


Paolo

