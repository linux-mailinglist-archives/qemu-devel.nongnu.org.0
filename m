Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF8E2C65B0
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 13:23:36 +0100 (CET)
Received: from localhost ([::1]:36574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kicml-00028Z-IT
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 07:23:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kiclT-0001GH-BP
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 07:22:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kiclR-0001yb-Pc
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 07:22:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606479733;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=awr3t4t64IMo1X4gNSoWgehjXc8beIFFS5qRdHswMao=;
 b=YBitPkgVcf75H4i4g8DrWtTUb4PLF9tmfE3mm8AI/d+OqXcmGd0WBYW71gfdmOQiTjCHP6
 ZUHxXC4sIZYccFH6e+Bo62tWRdbZ9fhLEZadJgaKM8bYpcoU7OG3X6IoZzFucyxsRNRdSI
 /UWARoIHbtZ4mVxPAVBLBeUEvnd3le8=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-294-xAmvEd1aPZek_f1dBNPIHQ-1; Fri, 27 Nov 2020 07:22:11 -0500
X-MC-Unique: xAmvEd1aPZek_f1dBNPIHQ-1
Received: by mail-ed1-f71.google.com with SMTP id z20so2350613edi.22
 for <qemu-devel@nongnu.org>; Fri, 27 Nov 2020 04:22:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=awr3t4t64IMo1X4gNSoWgehjXc8beIFFS5qRdHswMao=;
 b=mLQ0SQmnQjGEfnP6vgImXeOY5uOhwxukhjiDB5LCb9EJ+PMutPkvqgSyUrCtWSn8Tf
 FpCqAdSFRIBMeluvIScAh5rGq0v6xSbP2dWRb8/yP6PrA6mXgMY/qBwHmOptX+ubAIqV
 g7jUDKmQ0ENGyuCPxZJFcft6NpBY5fLB55LVrFPh/uS5SI+gjmkmn/Eub6qMUGAhnlBH
 +e3cyUXUEHjgmi9lNC7ADjtsoWJVXwBPRfW7+WfUlz4Ke99VNfhD96yWfx0lYY1kqvXL
 p1IA9+zQdbBrC6Mu62PyceiSVhv+rFmcKoo6rL3NxJ5tmEx7PcVqzr+6XbQhu6fMIT18
 1KmQ==
X-Gm-Message-State: AOAM5327TnQf5g3YNpDm4lW3SK4BJbB8xaFnLUb4Kovc6oll7WsRRARr
 pIwBlhE2U1kck82t4FNB6PM1B0OhgxEsUDzhR/j1Sq7VW2j/KioS6Fa0sRZIpWZ/yOFleyLuE9l
 ctLKIxo2AozrCu1OIV3Zchyc8bD+2NxjMyk6UArCpewpJ+6XAaLu2PHuAFY1NTSLCV74=
X-Received: by 2002:aa7:c904:: with SMTP id b4mr7402935edt.161.1606479729854; 
 Fri, 27 Nov 2020 04:22:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxiBBfHBasnTDVQmZK1IXyg6eXbTVh6EQ+ll6qtFZN5WzcCL4MyIOfhvdQpfRRn+CdM8duFxA==
X-Received: by 2002:aa7:c904:: with SMTP id b4mr7402919edt.161.1606479729662; 
 Fri, 27 Nov 2020 04:22:09 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id d6sm4359845ejy.114.2020.11.27.04.22.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Nov 2020 04:22:08 -0800 (PST)
To: Igor Mammedov <imammedo@redhat.com>
References: <20201123141435.2726558-1-pbonzini@redhat.com>
 <20201123141435.2726558-14-pbonzini@redhat.com>
 <20201126181036.3ff5d605@redhat.com>
 <8866f216-911b-2803-4b15-0e794c4c71e1@redhat.com>
 <20201127113154.1c9ef2c6@redhat.com>
 <70f2f8cc-0b5c-72e4-434b-35197c70809b@redhat.com>
 <20201127131245.60702c6b@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 13/36] vl: move semihosting command line fallback to
 qemu_init_board
Message-ID: <30719cc3-3e89-ab40-c4c8-05da2dd5772a@redhat.com>
Date: Fri, 27 Nov 2020 13:22:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201127131245.60702c6b@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 27/11/20 13:12, Igor Mammedov wrote:
>> Fair enough, I'd put -semihosting-config in the same bucket as
>> -m/-boot/-smp (machine configuration that isn't in -M) so I'll move it
>> together with them.
> it might be machine code, but I didn't see anything that depends
> on machine in there that's why I've suggested to move it right after
> we parse CLI options (i.e. as early as possible) to keep the rest of
> code cleaner

Yes, if I just remove this patch the fallback will end up in 
qemu_apply_machine_options.  That seems to be the right place.

Paolo


