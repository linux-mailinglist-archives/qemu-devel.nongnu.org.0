Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65259699A6B
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 17:46:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pShOH-0006Z0-Ct; Thu, 16 Feb 2023 11:45:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pShNs-0006BS-Dx
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 11:45:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pShNq-0001F7-U3
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 11:45:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676565921;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6jKBB5luktFpl6+1rcCPPHBjLthAo14aQ/BC6htff34=;
 b=Gv/UoDwnO2Pq9lCIFlPerHjArIYl3vSXXG9ufgJAHDRAt/VLRBIuqTkOG7fl5JxUWwQb6C
 Ue1nvFDMexfLdY6yVQee63cSTDs51Ar+OlYkeDqe1pVsVu/ewtyXd/BxUtL/7UmdPsU6wX
 w3QUkRVcDdngu619pnsqCk8svXlWpkc=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-37-7Zf5nbu4NjGkKzEwwV01cw-1; Thu, 16 Feb 2023 11:45:19 -0500
X-MC-Unique: 7Zf5nbu4NjGkKzEwwV01cw-1
Received: by mail-qt1-f197.google.com with SMTP id
 bz17-20020a05622a1e9100b003b9c1013018so1505782qtb.18
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 08:45:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6jKBB5luktFpl6+1rcCPPHBjLthAo14aQ/BC6htff34=;
 b=NjdroyKPduHnmGtiJ14j6olLn0hcvqhc9kgmnss4S/Y0Y/Kj9//00CSPpEx69dlY+K
 eVR8K6UQKu4qi3D/EWnHFr8I3nVL7svjNoar8VNnc50WX9teVGKZbDeA7bxfN/YjwGYg
 1+H1G6iDVdbmFWgh0hKjtGE0y0v15BgDOZM1VnpfSKPj1JqxagL5DK+Dd6KRscRSjfcK
 wiScDTToRIbWR4OnANoum2DfGwNJV9XedASNNoshTe2ov0ORY1p6feoH+B+NX1VCwNWl
 GVt1ISK1AmtbzlBHMGTFJKprV+wuOOQHHPlQkP6WqoAX0mpqBVrZ2+duJTABwU9oKE2/
 iHkg==
X-Gm-Message-State: AO0yUKWWcnmQBp7ORtZ4+hQrQu62QvpTO54SLWHbIScvKREjpfTNPCxz
 qevMUh00RCTepqtqdvlO/scqc4gJEb5IoMKTLftxmWiekw7iB5zr+kp3b6M0wXiIx7bsdjf9+NT
 JEG7Aqd7fa6R2MAo=
X-Received: by 2002:ac8:5a01:0:b0:3b9:b1eb:ad38 with SMTP id
 n1-20020ac85a01000000b003b9b1ebad38mr10699794qta.50.1676565918858; 
 Thu, 16 Feb 2023 08:45:18 -0800 (PST)
X-Google-Smtp-Source: AK7set91otgZbxM4jEvfkldI2DokfDIzaL3Wjax7b11aDbnBOnpWAsdDtxwcTTbouZ0AxZFQ8ir/IA==
X-Received: by 2002:ac8:5a01:0:b0:3b9:b1eb:ad38 with SMTP id
 n1-20020ac85a01000000b003b9b1ebad38mr10699767qta.50.1676565918606; 
 Thu, 16 Feb 2023 08:45:18 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 18-20020a370312000000b0071b1fe18746sm1530786qkd.63.2023.02.16.08.45.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Feb 2023 08:45:17 -0800 (PST)
Message-ID: <5f49ca57-003d-132b-47c2-e6ead5e92ff3@redhat.com>
Date: Thu, 16 Feb 2023 17:45:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [RFC PATCH 04/16] hw/arm/smmuv3: Add a system property to choose
 translation stage
Content-Language: en-US
To: Mostafa Saleh <smostafa@google.com>
Cc: qemu-devel@nongnu.org, jean-philippe@linaro.org,
 peter.maydell@linaro.org, qemu-arm@nongnu.org
References: <20230205094411.793816-1-smostafa@google.com>
 <20230205094411.793816-5-smostafa@google.com>
 <c3b7d353-e7da-4048-6e47-5c16cddab350@redhat.com>
 <Y+4ofnf3wWKenB7T@google.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <Y+4ofnf3wWKenB7T@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.351, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



On 2/16/23 13:58, Mostafa Saleh wrote:
> On Wed, Feb 15, 2023 at 05:29:04PM +0100, Eric Auger wrote:
>>> The property added arm-smmuv3.stage can have 3 values:
>>> - "1": Stage-1 is only advertised.
>> Stage-1 only is advertised
> I will update it.
>
>>> - "2": Stage-2 is only advertised.
>>> - "all": Stage-1 + Stage-2 are supported, which is not implemented in
>>> this patch series.
>>>
>>> If not passed or an unsupported value is passed, it will default to
>>> stage-1.
>>>
>>> The property is not used in this patch as stage-2 has not been
>>> enabled yet.
>> Usually the user knob (ie. the property) is introduced at the last
>> stage, ie. at 16/16.
> I will split this commit, move the knobs to the end and keep features
> definition as it is used by other commits.
> I think it would also make sense to merge the knobs commit with last
> one([RFC PATCH 16/16] hw/arm/smmuv3: Enable stage-2 support).

OK!

Eric
>
>
> Thanks,
> Mostafa
>


