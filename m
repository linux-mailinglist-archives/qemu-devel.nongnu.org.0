Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83FCC2ECE4B
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 11:57:03 +0100 (CET)
Received: from localhost ([::1]:35504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxSyU-0007DZ-3N
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 05:57:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kxSx5-0006CH-RI
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 05:55:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37354)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kxSx1-0004wK-4j
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 05:55:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610016929;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OWbLmQlZgMTbYZOsUmeBdmLxC4yi3iByBupY0i+XKAA=;
 b=DHT6gzgSAtf4WOrCVU035t2HFs8lbI5rtgWjpczG+MGCdptzHCQQmWVdIbP0mnAZMrqIZ9
 s6jlAUWSybQk0iLK3XLkIlg6oMArG+584In/y6TSONXT2GhS06HHhDsN1uguwWQbfndtYs
 bIstSKgABW7/ZgV6LHoMY8R3+2FXcwc=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-99-Ap06Y3glNTGCXlaofTJeaA-1; Thu, 07 Jan 2021 05:55:15 -0500
X-MC-Unique: Ap06Y3glNTGCXlaofTJeaA-1
Received: by mail-ed1-f70.google.com with SMTP id dh21so3215009edb.6
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 02:55:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OWbLmQlZgMTbYZOsUmeBdmLxC4yi3iByBupY0i+XKAA=;
 b=KekcgaxmBF39pMUgHJKfxSww+HdOSGQuvFlUrfGguV7uYGaMUIHlF16HeHQpaHwWCY
 mDxbr089C6jzBLo6wSRbxNCrOCh15JUIJXc3m+OXEN7wP+t08O10IMfxplX3J0N7Qq/d
 0L+53koOOV/A3DAnKfMv/3sZXja5Wd85UyyFQYjlvarSL+MXqpvC7roou6JjHCAZ4RLk
 iXrt18MFqKamOg/fkg6a/RJAyjzbfejz970AbhadpHEDU9Yoc6JRMX1SXJhOj1tr93E9
 t/tiG37ticbkEcTDeuqZnwUJwV9/yTMAdbRyoLAnTpDWFaxCzjX0HKOqNG6knTyCbUYw
 mj0Q==
X-Gm-Message-State: AOAM530MGaJmtaKTNxyrjKs26Bmcme0MjvDRxgkE3KG2DcXd4ZJ88FBD
 ar74QxTBa4J4NzVXq5oTX11owA9FZ1DDNvzOwMnEwxne3hyfccJfqZE6zoeUiX6z2Xne3ktRgZ5
 aUbdTWD6JqQFkzFk=
X-Received: by 2002:a17:906:810:: with SMTP id
 e16mr6174796ejd.34.1610016914825; 
 Thu, 07 Jan 2021 02:55:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy8COpcLH12KHdTfnrCd6fpZSbIjh1E8k/eD9chRwu0mM2ZmFomHh3h80718DYZUrHIu6fgDQ==
X-Received: by 2002:a17:906:810:: with SMTP id
 e16mr6174791ejd.34.1610016914668; 
 Thu, 07 Jan 2021 02:55:14 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id p12sm2274073ejc.116.2021.01.07.02.55.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Jan 2021 02:55:13 -0800 (PST)
Subject: Re: [PATCH v4 5/5] whpx: move whpx_lapic_state from header to c file
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 Yonggang Luo <luoyonggang@gmail.com>
References: <20210107101919.80-1-luoyonggang@gmail.com>
 <20210107101919.80-6-luoyonggang@gmail.com>
 <CAJ+F1C+q9e08zX9OqkS4294oCNBAf-Gs7L9AomtYrc7vKyqCEA@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <7b3d24b7-d301-549d-abc2-613f02c8843e@redhat.com>
Date: Thu, 7 Jan 2021 11:55:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <CAJ+F1C+q9e08zX9OqkS4294oCNBAf-Gs7L9AomtYrc7vKyqCEA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.249, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Sunil Muthuswamy <sunilmut@microsoft.com>, Ed Maste <emaste@freebsd.org>,
 QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/01/21 11:28, Marc-André Lureau wrote:
> Hi
> 
> On Thu, Jan 7, 2021 at 2:26 PM Yonggang Luo <luoyonggang@gmail.com 
> <mailto:luoyonggang@gmail.com>> wrote:
> 
>     This struct only used in whpx-apic.c, there is no need
>     expose it in whpx.h.
> 
>     Signed-off-by: Yonggang Luo <luoyonggang@gmail.com
>     <mailto:luoyonggang@gmail.com>>
> 
> 
> Similar patch pending:
> https://patchew.org/QEMU/20201219090637.1700900-1-pbonzini@redhat.com/20201219090637.1700900-3-pbonzini@redhat.com/ 
> <https://patchew.org/QEMU/20201219090637.1700900-1-pbonzini@redhat.com/20201219090637.1700900-3-pbonzini@redhat.com/>

This one could still be applied before or after mine, it makes sense.

Paolo


