Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B753753F7
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 14:41:11 +0200 (CEST)
Received: from localhost ([::1]:56560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ledJV-00065c-QQ
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 08:41:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ledHw-000583-Dt
 for qemu-devel@nongnu.org; Thu, 06 May 2021 08:39:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ledHt-00057x-GT
 for qemu-devel@nongnu.org; Thu, 06 May 2021 08:39:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620304767;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vq5/UGRP9miuGTSdz+866XLEizhy1UTprID4Z4BT1Rc=;
 b=BbVSdh/Di00sUIcatxQUaMQYYL1G4xo4ZEnKEupeUK7+vUpol8hVFl/mC+oqU2NSU7lbG4
 l36MlSyD3AosK6WUhTkuQg243Sawx4jjW20FLIsEC2lSzVzuY+5hXGoOQtJVlrMFlkrbLv
 TcE35H7FP4jkADbVspiATQpXf5Pc8ZQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-205-1ow2YBLTOBmNufMt5JmGvw-1; Thu, 06 May 2021 08:39:26 -0400
X-MC-Unique: 1ow2YBLTOBmNufMt5JmGvw-1
Received: by mail-wm1-f72.google.com with SMTP id
 c2-20020a1cb3020000b029013850c82dbcso2612299wmf.5
 for <qemu-devel@nongnu.org>; Thu, 06 May 2021 05:39:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vq5/UGRP9miuGTSdz+866XLEizhy1UTprID4Z4BT1Rc=;
 b=TTGUXywlVdi86dWbetshwknm0VP5fNspEm353kXicFc8nSWhwLliE2dH/lDrNCqoj7
 3hD+2IvQWHh9jO4VX+c1OzGSgU0NIvguYhosJJKSfTgP75bdsxnETthn3Kd1UXiSOABC
 ei4d/29OFgyAUHSCTCCJAhyzSyiTmDPLJi4bo/5sRUCNwu2gvjSeiKHY8DwkMP+NZGFc
 c3BumIqrPxjKYPiPiX133IXqUycJuNEhWo/jGeutHtq/Rt1I5DAgA5c+GtZPlBUHB4p1
 omgBlEpcOIfu3LP324E7UaXLZwUK0jmycR7BuCqaFMRlpIvoiQoXnhragOUk13Z94Uio
 bIeg==
X-Gm-Message-State: AOAM531Y7g62Tajyg8QVU8Zt3HjjAnMXdSLMkHjPxkE3Gri4VdDry9yn
 mQ/59OjVegwWLj0S/Eb+p2Npt0s/8NueKZkPBKngGvk8+sk12QP4SFe8goCBptFvxmkGzBtXKvM
 QXTSgQFwSWSKLABc=
X-Received: by 2002:adf:d0cd:: with SMTP id z13mr4863253wrh.373.1620304765066; 
 Thu, 06 May 2021 05:39:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx2AAxpsV+7Evom5F+HIctY9lB15P7yNhWc+lPiS6FpTt1S6fC3RBOeWCUxdxq4pOv2v17BWA==
X-Received: by 2002:adf:d0cd:: with SMTP id z13mr4863214wrh.373.1620304764628; 
 Thu, 06 May 2021 05:39:24 -0700 (PDT)
Received: from [192.168.1.19] (astrasbourg-652-1-219-60.w90-40.abo.wanadoo.fr.
 [90.40.114.60])
 by smtp.gmail.com with ESMTPSA id u2sm4279629wmm.5.2021.05.06.05.39.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 May 2021 05:39:24 -0700 (PDT)
Subject: Re: [PATCH 3/5] gdbstub: Use fixed-size array in GdbCmdParseEntry
 instead of pointer
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210505170055.1415360-1-philmd@redhat.com>
 <20210505170055.1415360-4-philmd@redhat.com> <877dkcnk7c.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <42044899-6704-7d33-0a73-58fd00adc7ca@redhat.com>
Date: Thu, 6 May 2021 14:39:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <877dkcnk7c.fsf@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.69,
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
Cc: Kyle Evans <kevans@freebsd.org>, Greg Kurz <groug@kaod.org>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Warner Losh <imp@bsdimp.com>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/6/21 2:01 PM, Alex Bennée wrote:
> 
> Philippe Mathieu-Daudé <philmd@redhat.com> writes:
> 
>> GdbCmdParseEntry should have enough room with 20 chars for the command
>> string, and 8 for the schema. Add the GDB_CMD_PARSE_ENTRY_CMD_SIZE and
>> GDB_CMD_PARSE_ENTRY_SCHEMA_SIZE definitions.
>>
>> Do not use pointer to string of unknown length, but array of fixed
>> size. Having constant size will help use to remove the alloca() call
>> in process_string_cmd() in the next commit.
> 
> I don't understand how this helps. The alloca is being used for an array
> of GdbCmdVariant so why do we want to enlarge the size of the parse
> table entries?

This patch is crap indeed. I'll post another one with more sense.

Sorry about this,

Phil.


