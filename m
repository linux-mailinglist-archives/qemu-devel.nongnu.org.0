Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D3927B219
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Sep 2020 18:42:52 +0200 (CEST)
Received: from localhost ([::1]:40876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kMwEl-0003SQ-Dr
	for lists+qemu-devel@lfdr.de; Mon, 28 Sep 2020 12:42:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kMwD6-0002p1-PZ
 for qemu-devel@nongnu.org; Mon, 28 Sep 2020 12:41:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25206)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kMwD5-0001Ov-5G
 for qemu-devel@nongnu.org; Mon, 28 Sep 2020 12:41:08 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601311266;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5SouLSisfADn6eCVweRXxTlKXU5Hsn/x5WINz5YW2z4=;
 b=BvUj7gjsB4Q8oTUIDKfnJC1vLgESAHalyX+l8yTMfbzeFYu7WFDEN32TrR54ebtlBlo1cK
 qZgTCqZlcDEwmNW3yMp/OfQy0AZ5OeRjAPQU2q0I+TikyREqxiIa7sFdbmUQr+FVG9YuYO
 wxuZTqY3FOugo+tKsIkVdDpoI/+URdc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-388-KsuCHMudMRCpL_BDUz8aDw-1; Mon, 28 Sep 2020 12:41:01 -0400
X-MC-Unique: KsuCHMudMRCpL_BDUz8aDw-1
Received: by mail-wr1-f72.google.com with SMTP id o6so632879wrp.1
 for <qemu-devel@nongnu.org>; Mon, 28 Sep 2020 09:41:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5SouLSisfADn6eCVweRXxTlKXU5Hsn/x5WINz5YW2z4=;
 b=i0cnfLgBDZjMcuhiHRZEG79o+U0LQaAagQMUIolroJnN5mcy1c+uXRLHuymrLe8nHo
 iFtwk2ZSSXZ7jiq6/BfGeVAOHdv43olikIlP302y8+XUhBMmMOLoJoSIqPZamVZnrs6T
 fyXpjQN1VHt7seLh6yMteDcNA2Ywgd2mUMd9FTQjjDYMc6BidzgvzTlJrBTC+6KQ4JkM
 OIc02AyaPznHSzqQZ3ahRyxw3qRxwUJkFkXCLAUPLKDuo3GwPVaZBWysXnpSvxEeppYI
 huVV/yGQa7yZLf/0Qx3izzAhTjUHzGe0Br3M8sWhEK7wJk/C3vMPJsrWnsWW+fg27c12
 KfnA==
X-Gm-Message-State: AOAM531niM4oXU2Fzyo3EA4NA3rSEOA912uvfk0RWqxKsCmxF4TCHwPA
 F8L6CGx9sxF7gzrNig1k5URoS7+wxiO7otzUjoJpiVfH4otb//KonUqsjmt/agbO/FgYT/BJpqe
 T2dEHqumB2SR5LpA=
X-Received: by 2002:adf:d4c7:: with SMTP id w7mr2665553wrk.263.1601311259760; 
 Mon, 28 Sep 2020 09:40:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyI4mLdMk8Q2PFg3BUDNRbl7EOnn/lIbIeupY0eYXuw5uqvKPhgbG5fPg3sFS3rzb4pahfnSw==
X-Received: by 2002:adf:d4c7:: with SMTP id w7mr2665537wrk.263.1601311259566; 
 Mon, 28 Sep 2020 09:40:59 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:f4f8:dc3e:26e3:38c7?
 ([2001:b07:6468:f312:f4f8:dc3e:26e3:38c7])
 by smtp.gmail.com with ESMTPSA id 185sm2034422wma.18.2020.09.28.09.40.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Sep 2020 09:40:58 -0700 (PDT)
Subject: Re: I wanna fixes plugin on windows, any suggestion
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <CAE2XoE-PpsaqJOfEq0iUSkH6N8skkqFAY+2QkSbnENiszA0xQg@mail.gmail.com>
 <a50bc12c-7aa1-19a3-c39e-02328aeaca38@redhat.com> <87zh59q4wn.fsf@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <45b8d99d-1133-44ee-d829-711dfb442b24@redhat.com>
Date: Mon, 28 Sep 2020 18:40:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <87zh59q4wn.fsf@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/28 03:47:08
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.687,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: luoyonggang@gmail.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28/09/20 17:47, Alex Bennée wrote:
>> Plugins cannot work on Windows, because they would be specific to one
>> executable as far as I know.  Plugins would have to link with the
>> emulator's import library, but there would be one import library per
>> emulator.
> 
> I'm not sure I follow. There is nothing specific about the QEMU binary
> it cares about as long as the API symbols exist. Are you saying each
> QEMU binary will have different resolvable names for the external
> functions in plugins/api.c?

On Windows, they would not be different resolvable names but you still
need to use the proper import library.  I don't know if it would still
work by chance but you are not supposed to do that.

Paolo


