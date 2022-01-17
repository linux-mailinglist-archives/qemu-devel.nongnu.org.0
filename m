Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04CAE490FF0
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 18:51:38 +0100 (CET)
Received: from localhost ([::1]:47980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9WAI-0005w7-NT
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 12:51:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n9W7p-0004AL-Ud; Mon, 17 Jan 2022 12:49:05 -0500
Received: from [2a00:1450:4864:20::32b] (port=45587
 helo=mail-wm1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n9W7o-0005F7-EX; Mon, 17 Jan 2022 12:49:01 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 c126-20020a1c9a84000000b00346f9ebee43so1280080wme.4; 
 Mon, 17 Jan 2022 09:48:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=YSuk9t9InWEHqrpcAklD/rrQaBzVhXb/BXRwXvLf7Ew=;
 b=LphsIY4Gh2nraJVtCAsDJ6qFKhxMyQvdHD/FmnLHzjKcoAHtwi1oLH5RYhJB98p9dD
 rthBDXjAKWPO8XWrcRuoXn6AtOGGRIyBx8ahkTp31Lx0RNBI3baLZYdMqpD6re9+Djkt
 W8DXYknk4oV5ucZE//pfpWg2R8orIZDvLWudBgZvvVvont5ueLwKYNhP8un2xgvPr4oi
 KtdfPaaufoQT4UUi2XqTlro6w6Fvwq7nHFQE0+Sq6scH578HPrYG7aCOt7H/wUjUQAdG
 EOAtx7L+qFAU5Y/ZCuQt9QfN33AhQcXl5qGe4m4z+3T6UzhVDUmqJQC+3zerpGJS1yon
 vv8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=YSuk9t9InWEHqrpcAklD/rrQaBzVhXb/BXRwXvLf7Ew=;
 b=lOFh2lMcTHD0711ydc/1znbqQd2IZO+0saCvkDkv960/i5Hie23CS3pWJT7Ovjvmdx
 Qw0wrkK6WSfZjN4oyoVX+mNDi2FEiAN0PWjtcAfPGYM12nVc2iSbGtwi5pW9Z9gm3cgT
 UKUsfHCYH7STGdWMoPjT+2mQ005utOi36aF6RxnDmUBKZ7AGEDDXQfp6+BZSkLRkZkfI
 09TctyWNnxIDS7mnI3ApkMvDwJKHEu6f+7pU1HKhXuAN710XhO59ZF4TgWaToXU3JDpE
 KefcQsjTHAFFhH6+Bgkonzmkj3WRoBoRtqXHaogHZEFiMU8M5QvO//cpoDX++EYah4dc
 DhOw==
X-Gm-Message-State: AOAM530kCTNTAoX3+rzG6731m10ukEmdti0nZgi4YJwIYmYu+mPE39Fc
 KMm+EYPPO444adfoocAuW14=
X-Google-Smtp-Source: ABdhPJwDijkSfuTZME4ogYA6S/liCyY7rRmAlQ+Ili2n8LvUG65xSEM6WjMbSL+PpoZzToviAXZC2w==
X-Received: by 2002:a7b:c762:: with SMTP id x2mr27784073wmk.70.1642441732791; 
 Mon, 17 Jan 2022 09:48:52 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id 1sm12769516wry.46.2022.01.17.09.48.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jan 2022 09:48:52 -0800 (PST)
Message-ID: <98127462-394f-45ef-5c68-c8ad053f2ba7@redhat.com>
Date: Mon, 17 Jan 2022 18:48:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 2/4] build: make check-block a meson test
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20220115222154.341628-1-pbonzini@redhat.com>
 <20220115222154.341628-3-pbonzini@redhat.com>
 <7d7acd1b-5144-4ad5-102a-7517b43b1ac5@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <7d7acd1b-5144-4ad5-102a-7517b43b1ac5@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/17/22 11:09, Thomas Huth wrote:
>>
>> +  qemu_iotests_formats = {
>> +    'raw': 'quick',
>> +    'qcow2': 'slow',
>> +    'qed': 'thorough',
>> +    'vmdk': 'thorough',
>> +    'vpc': 'thorough'
>> +  }
> 
> I think the default behavior for "quick" should be to test with qcow2 - 
> most iotests require that format and that's what we're currently using 
> with "make check-block" by default... i.e. please swap raw and qcow2 here.

You're right, also the tests should be disable on non-POSIX systems.

Paolo

