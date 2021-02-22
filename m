Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D05A321ACD
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 16:07:59 +0100 (CET)
Received: from localhost ([::1]:40382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lECoY-00042x-9M
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 10:07:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lEChe-0007Fl-OV
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 10:00:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lEChY-00046Q-T9
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 10:00:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614006042;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Tcku4CWX8EoneiyDiLe488Yi2y2LRR70K1j8Q6pZoac=;
 b=CTNJHS+QFatbZ2oqe2YYHqz0AIwqq/1veCb0tK+ic2g9Ftz8CcgKzbFJkX4cmYo5k1H2CV
 8RwoevF3nFtgOaiZRfNVItWXEhgaukk5/vpnUhulv5+fQJMlVQME343h0BXf7vYjGYCQ0/
 1Hj29sO8hpKB7MDwJxruckJHaMdI8G8=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-457-1QYAq4-_NH2jy6J2j2Pu3w-1; Mon, 22 Feb 2021 10:00:40 -0500
X-MC-Unique: 1QYAq4-_NH2jy6J2j2Pu3w-1
Received: by mail-oi1-f197.google.com with SMTP id w79so6273813oie.7
 for <qemu-devel@nongnu.org>; Mon, 22 Feb 2021 07:00:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Tcku4CWX8EoneiyDiLe488Yi2y2LRR70K1j8Q6pZoac=;
 b=rhTPbeXjW9KjVV4vwso/oBEf3WSDLs3hemsF30f3WuqHnvNjZIZAEwwonDGgdjNSQ4
 +zN3jC9luCWXLqlDISbsrYi+psA8zK9Zbuo68kIr+NpZ2v0TxoMtIjPvc3wUycZorj1S
 iuwRAHwauqlaRUxRtQYcxS2w0V20h2mcJ6TJcLVvDCJYljNmcpq1CFlbUb3uJgF2Huwj
 CIca867LtjpVSn8Wa3xX7bZRh4/EKeLYFZ6Do/o9KSD2dEW82UXz99Z+X2gDHER30buw
 prRK1slfOq1abts6HhvRqvuKtwyUjWHN3Leb9YRvEiDUoNlTcgNKUms4t4eyuBAiiPrO
 9bAA==
X-Gm-Message-State: AOAM530l6glzWPChzWSmpHGXxGVm+pZoenfG8+8jO1WaRVDTekogR0uC
 Ysg9MsKg7fVkpmyY9f3bcqQj9PtZpN1aa2HGJNNQCPIw+z93y/svLhrl4cO/uisfBgm+skVv8bT
 J40T9o1f82/lKE2E=
X-Received: by 2002:a4a:88a2:: with SMTP id j31mr16433954ooa.71.1614006039455; 
 Mon, 22 Feb 2021 07:00:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJywrgwz1UHmXLy+425VRdsAesUht79uoJQcRcR8RPH0F/fgtYkxNrDdFiUIHvOysmI1oiXjAg==
X-Received: by 2002:a4a:88a2:: with SMTP id j31mr16433942ooa.71.1614006039278; 
 Mon, 22 Feb 2021 07:00:39 -0800 (PST)
Received: from [192.168.0.173] (ip68-103-222-6.ks.ok.cox.net. [68.103.222.6])
 by smtp.gmail.com with ESMTPSA id
 v14sm3880888oic.54.2021.02.22.07.00.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Feb 2021 07:00:38 -0800 (PST)
Subject: Re: Interactive launch over QMP socket?
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <47b15088-514a-8174-029d-8d9c4571960a@redhat.com>
 <YDOhB4Db5xg52Zgv@redhat.com>
From: Connor Kuehl <ckuehl@redhat.com>
Message-ID: <d137b4ee-7dbe-6bd5-63c9-b20a80259d08@redhat.com>
Date: Mon, 22 Feb 2021 09:00:36 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YDOhB4Db5xg52Zgv@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ckuehl@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ckuehl@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: jejb@linux.ibm.com, npmccallum@redhat.com, qemu-devel@nongnu.org,
 dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/22/21 6:18 AM, Daniel P. Berrangé wrote:
> 
> ... so this doesn't actually seem to need to be done in QMP on the fly.
> It can be provided on the CLI, which seems to be possible wth the args
> shown earlier.
> 

> 
> It seems like this is all doable already unless I'm missing something.

That's correct; however, I would like to make it possible for the 
entirety of it to happen on the fly, ultimately rendering the CLI args 
optional.

Connor


