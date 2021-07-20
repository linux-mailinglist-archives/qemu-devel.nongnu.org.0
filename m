Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C69B33D0141
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 20:09:48 +0200 (CEST)
Received: from localhost ([::1]:51740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5uBf-0000Bk-Tb
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 14:09:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m5u8G-0002pJ-9a
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 14:06:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30126)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m5u8A-0001cV-PZ
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 14:06:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626804369;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RWNvnMmiAazQ4Qy7UzK+q62rQRofsXM19FpCEY2tonQ=;
 b=ftRsHr02Vbw9bfb0Lq697lAEZpl3WVH6P8jJZd5OcxHnTeuAP/8Q7rI3hPj4atH0Uac8il
 kcFtnzhsmTaSYMkKbAsSLgjoJk2Fts0B5gBPTi33PKVZPB31Nz0W6IazeBpCnx096bdreJ
 /cPj/1je55bR6u1aMfzCw0A8jz1A9Q8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-388-c3d8t9qnPCW_zYOxHBwQJw-1; Tue, 20 Jul 2021 14:06:08 -0400
X-MC-Unique: c3d8t9qnPCW_zYOxHBwQJw-1
Received: by mail-wm1-f72.google.com with SMTP id
 g13-20020a05600c4ecdb0290242a8f4cf9cso33943wmq.5
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 11:06:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RWNvnMmiAazQ4Qy7UzK+q62rQRofsXM19FpCEY2tonQ=;
 b=EKxVZk7wGVFqcHv0TONf4tOCs7nL9Qv8JOBY3LWn3uTeabi4XKLUrMcdTC0sUaDeOf
 SMOEhiV9eO2aTVeF4fdOqwFAXS8HRpa7+H1++DT0/SBziAgEm+dyGgEC/lyE39P0z5/s
 Hxmm0WGmp2X1hRP7J6TVPSORshKa+hy+mYl1/J9VmzYlW16FU+fJZXP/sgoL4LiT4PgV
 /k0mYnPjSugm1B1P3KAmiS2C0PTcBZHli3u0D8j/4dhu7SpzNSfTCqybZTfmOk8QG4Sq
 O0+dVN6xzCEkX23u1Lv30TI+cQsiMT1Se0zvV6UkvtTXwXdA9UkiIhSAHyD4RP+Ev6J9
 9fvQ==
X-Gm-Message-State: AOAM530eFi+KR6gul3LV+nXXjss1JGY5KZXoeG91Sgy3OdeztgVEGoM8
 64/xoxbGLkcS1xERWsfArgiSln76z2tSz20YNCbw/pGvraC2N9JTqI8pAdGIOQvsp8eDyS3xlSZ
 U18rE/Elq6FxYPvU=
X-Received: by 2002:adf:f642:: with SMTP id x2mr37892808wrp.37.1626804367319; 
 Tue, 20 Jul 2021 11:06:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxSgXshRpfc5P/I7eMwmoIbA8V9M+eLYjrN88RWp3wPqkjxfWcu+p/IQ6Uzo4+uINdfFZlFOA==
X-Received: by 2002:adf:f642:: with SMTP id x2mr37892796wrp.37.1626804367216; 
 Tue, 20 Jul 2021 11:06:07 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id y12sm8207025wmc.12.2021.07.20.11.06.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jul 2021 11:06:06 -0700 (PDT)
Subject: Re: [PATCH 11/16] microvm: Drop dead error handling in
 microvm_machine_state_init()
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20210720125408.387910-1-armbru@redhat.com>
 <20210720125408.387910-12-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <956ce84a-d9b8-ccc9-c76b-f38271050d04@redhat.com>
Date: Tue, 20 Jul 2021 20:06:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210720125408.387910-12-armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Sergio Lopez <slp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/20/21 2:54 PM, Markus Armbruster wrote:
> Stillborn in commit 0ebf007dda "hw/i386: Introduce the microvm machine
> type".
> 
> Cc: Sergio Lopez <slp@redhat.com>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  hw/i386/microvm.c | 5 -----
>  1 file changed, 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


