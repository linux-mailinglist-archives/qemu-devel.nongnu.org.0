Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1418C4AEBB9
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 09:02:36 +0100 (CET)
Received: from localhost ([::1]:52944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHhvu-0002l6-CB
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 03:02:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nHhTD-00009g-UI
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 02:32:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nHhT9-00024b-85
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 02:32:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644391964;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mkkrsZ7CzP492kNFmv/XcMa9BlExYxfE/WQ7tbnUQGw=;
 b=eNBSRZ3l70Dn8EthKcKlh0JCYJtsMu8WY5y/YPuOETorNbwq15ZvdL22TnESaIprkDepIB
 nt0tED0wpS4NPgWWbum6X8aTT5kDLFn3a1wsTgyV6j8XcITS+Ssq4GtavATMK96klTAQ/S
 GjaCRSw4oXJVV0myc25HKoVkbtY4LLc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-408-u4rxGIkpONieSFgZ9Wjt6Q-1; Wed, 09 Feb 2022 02:32:40 -0500
X-MC-Unique: u4rxGIkpONieSFgZ9Wjt6Q-1
Received: by mail-wr1-f70.google.com with SMTP id
 p9-20020adf9589000000b001e333885ac1so737800wrp.10
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 23:32:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mkkrsZ7CzP492kNFmv/XcMa9BlExYxfE/WQ7tbnUQGw=;
 b=wl9IEZ3sgALTHIyFv/E1ZYSIqpw7tIiFBPY4jzXG5S4zHYOARuyLkV24ahK0g/tz/I
 P7EW3t0NCkiM6JA+m7QTijdUUAI7+bAidHWSaVOTZ8NnnncKp/A1mttDiLlZgiOzbLL8
 LPTmvCpA4kxutO9YkAk6VT0+eB4TWq/5lGEjp8mKMR0mPs0wDOS54mK4qBnmz4a8lRlC
 J/wOeQ+r2ew4j8JsqI97YGl3shKhM7mTMe4cUXiT8PNcomful9Z1QJjp+bXmr0dRyLjb
 /WzdUVslvQFRa8WjrFBA06Y4OIsq6EPG8ItvLB9T+O8pOpzOiiBh1VwEa4nq3ex6mtfE
 FtHw==
X-Gm-Message-State: AOAM530NgU76rMoj78A0fyK9+u+uQGaeRakgNUaFnL3UoL1wSER/fiQ/
 oqtBa76Re4XZeX/oYwtJeoVQ9NOnPiEziFDOPCdl8pUBKxhZm/tIxTKk2C6W25+i2uCkRLP8dxF
 EBa906Qn4sOowMKo=
X-Received: by 2002:a05:6000:15ca:: with SMTP id
 y10mr940363wry.417.1644391959540; 
 Tue, 08 Feb 2022 23:32:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz8Xm73y/DGGepwz0t1qC481FW0IrJ0sZhLr5UltkM6BramuVlituc76Ia8warHbtYWP71Pxg==
X-Received: by 2002:a05:6000:15ca:: with SMTP id
 y10mr940348wry.417.1644391959341; 
 Tue, 08 Feb 2022 23:32:39 -0800 (PST)
Received: from [192.168.8.100] (tmo-096-196.customers.d1-online.com.
 [80.187.96.196])
 by smtp.gmail.com with ESMTPSA id o22sm3888199wmh.13.2022.02.08.23.32.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Feb 2022 23:32:38 -0800 (PST)
Message-ID: <61c20281-e1e0-a12b-1840-97fc89d059fd@redhat.com>
Date: Wed, 9 Feb 2022 08:32:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] Revert "check-block: replace -makecheck with TAP output"
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220208124432.84924-1-pbonzini@redhat.com>
 <aba10fdb-c6be-f521-deed-b523bc084073@redhat.com>
 <90afdf74-ab8a-9bc6-71ef-6c0645566091@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <90afdf74-ab8a-9bc6-71ef-6c0645566091@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08/02/2022 17.21, Paolo Bonzini wrote:
> On 2/8/22 15:51, Thomas Huth wrote:
>> On 08/02/2022 13.44, Paolo Bonzini wrote:
>>> This reverts commit d316859f4e28c74ab8b618895d2a5e0a865d3cf1.  The
>>> TAP output is inferior in that it does not include the diff for
>>> failed tests.
>>
>> What about dumping the output of meson-logs/testlog.txt instead? The diff 
>> also shows up there!
> 
> It does, but sort of by accident because it's not valid TAP (and in fact it 
> continues with a TAP parsing error).

Ok, then let's try to go with my series (I'm working on a v2 right now) and 
the additional patch that prints out the diff to stderr instead of stdout, 
please ... I hope that should be good enough, and certainly looks way nicer 
than reverting to the old way of running the iotests.

  Thomas


