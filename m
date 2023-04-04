Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BDE76D660F
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 16:56:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pji4K-0000qW-Fy; Tue, 04 Apr 2023 10:55:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pji4J-0000qK-6U
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 10:55:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pji4G-0002UA-LC
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 10:55:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680620128;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kdU/+ctku1zi0ulE1XXGeEHs6eyIPwmeDvFauVVxst0=;
 b=hxi4J7hkIIt17P7ljJYJXpkyn/kX9PDA5LV3ppU4qH0ZURKd8VRBybYWzwGBdc8anrojlj
 6OzISFcZUZp827hoLP1+1GxSI568WtYmmilZw7FtLLN8vV/8qZz1X4/67n8mhyDlcJJIwu
 /IS/u+5ACYMO0xxf5bVp016juU2BUn4=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-338-OfpgDfKDMESgERO5AUubzA-1; Tue, 04 Apr 2023 10:55:26 -0400
X-MC-Unique: OfpgDfKDMESgERO5AUubzA-1
Received: by mail-ed1-f69.google.com with SMTP id
 t14-20020a056402240e00b004fb36e6d670so46188813eda.5
 for <qemu-devel@nongnu.org>; Tue, 04 Apr 2023 07:55:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680620119; x=1683212119;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kdU/+ctku1zi0ulE1XXGeEHs6eyIPwmeDvFauVVxst0=;
 b=oo/hzoiFvCnogEZVBzBxFBmAKUmrHr6udwkt9rQ2LMJOuGPOuZy3Lf2pyRzB+vOkHb
 cwmTeVzL1Qao/pczxeyfPCKXpTzF062TMGWXYxl8uy6t5EMrOXkx4Z/NtRdX021Eu6EM
 R3lsQlrJU+T6mXTyamDgpdzaKFTlhC+AavXAC2w5G415DWBJsi/ugb2eSvzpUFwavXL6
 m08eR8Ad0ortYIvJRD4AYxR0JX7/A4u+wDggen0/DZmxIsu5TLp36X+JDZv71vq9pCMW
 LMNvLoBeU7+9hJRxiiM9yHp+LL+a7FIn73cSBItebjc0V4h5qAkWJ7EX+WG8z3c3DIKK
 1d1w==
X-Gm-Message-State: AAQBX9fzMSYljL84QTRtXFJZkQa1a7HuD/NVmdX4ENaz9nv30dN9++iv
 Ze//2u5NZXE1R20DXAHdJ4OvoDwyxOx+vq1Bv3B8bOZ67iMWL8yUJLxZ8OHqwXLhbwAbLs+B9aG
 fH37AZPNPvp1BoPI=
X-Received: by 2002:a05:6402:125a:b0:502:91c6:fa8f with SMTP id
 l26-20020a056402125a00b0050291c6fa8fmr2303708edw.42.1680620119344; 
 Tue, 04 Apr 2023 07:55:19 -0700 (PDT)
X-Google-Smtp-Source: AKy350YQQUF0ACgRNRH+7vGBtzhtQFUmDhxZjW4bM94/YNtGlwoqo8UQOe8jNNKH74BWPqJ3VE8S8g==
X-Received: by 2002:a05:6402:125a:b0:502:91c6:fa8f with SMTP id
 l26-20020a056402125a00b0050291c6fa8fmr2303690edw.42.1680620119029; 
 Tue, 04 Apr 2023 07:55:19 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 28-20020a508e5c000000b004c13fe8fabfsm6014256edx.84.2023.04.04.07.55.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Apr 2023 07:55:18 -0700 (PDT)
Message-ID: <20b559cb-28ef-4603-bbf3-994414c2681a@redhat.com>
Date: Tue, 4 Apr 2023 16:55:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 10/10] hmp: Deprecate 'singlestep' member of StatusInfo
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>,
 libvir-list@redhat.com, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Eric Blake <eblake@redhat.com>
References: <20230403144637.2949366-1-peter.maydell@linaro.org>
 <20230403144637.2949366-11-peter.maydell@linaro.org>
 <87wn2s12bu.fsf@pond.sub.org>
 <CAFEAcA_v4yt1S+jjX2acyDLjb6OGTGOSLGxGUkH5XALKjBkHVQ@mail.gmail.com>
 <875yabzsmc.fsf@pond.sub.org>
 <CAFEAcA9owMUFkwy-CPC7i=ZFiqce=bzV9YJNFK9YQbh3oOAj1w@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAFEAcA9owMUFkwy-CPC7i=ZFiqce=bzV9YJNFK9YQbh3oOAj1w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.925, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 4/4/23 16:24, Peter Maydell wrote:
> I think on balance I would go for:
>   * remove (ie deprecate-and-drop) 'singlestep' from the QMP struct,
>     rather than merely renaming it
>   * if anybody comes along and says they want to do this via QMP,
>     implement Paolo's idea of putting the accelerator object
>     somewhere they can get at it and use qom-get/qom-set on it
>     [My guess is this is very unlikely: nobody's complained so
>     far that QMP doesn't permit setting 'singlestep'; and
>     wanting read without write seems even more marginal.]
>   * keep the HMP commands, but have both read and write directly
>     talk to the accel object. I favour splitting the 'read'
>     part out into its own 'info one-insn-per-tb', for consistency
>     (then 'info status' matches the QMP query-status)

I think the read part could be added to 'info jit'.

Paolo


