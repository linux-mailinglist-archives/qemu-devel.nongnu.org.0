Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A903F6212
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 17:53:19 +0200 (CEST)
Received: from localhost ([::1]:33254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIYjm-0000nS-L1
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 11:53:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mIYi8-00081n-0g
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 11:51:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mIYi2-00068r-TA
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 11:51:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629820290;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ewXnhtx+roG8nGP2FTv5iOY/2ULoLva+ZiNTJC3+qek=;
 b=bdgWztEmNoMCPtqdQiMMT3H+VE8OU9VXW6XKNHJcRWBynz0lVoyGK7aXD09SllhMRZ1w3g
 QP8ncaXJTaqXc9O7sNMaypI/4v9NeHLj4T+cgHTWu9G3taXywffG2JWQ8/b1xWHzd/DMyt
 3FP8AqLeAuBVonxTdrJiqGzelJ2JZ6s=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-515-kxfWR24aOxi5jq69QxMSrQ-1; Tue, 24 Aug 2021 11:51:27 -0400
X-MC-Unique: kxfWR24aOxi5jq69QxMSrQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 d12-20020a056000186cb02901548bff164dso5875902wri.18
 for <qemu-devel@nongnu.org>; Tue, 24 Aug 2021 08:51:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=ewXnhtx+roG8nGP2FTv5iOY/2ULoLva+ZiNTJC3+qek=;
 b=UwCkg2m/HzDWBJN+RwrLAThGCDVYMSJhOL7+yCZfcRp7G4Ze+GXopEGD6CWQxzttB0
 iLtNOjAo9xxej/pYW+tqac4ypYiyyvXjUA+j2vZPL67QVGUeQahKhmtNlcApH737liNr
 rq5ZEFZ75MPWD+ytyf1fWj14fDcD/N0ohijD9nXNvydTklEFAf7L6MbnygvxjC59p9ST
 JpHX7ucPWwUzb7UiVom6LyxZ758PUB1OZwEOmRrWG8QquzEj/THdyBHaNvdsvLBNnqUC
 /jlKL1HZVw6Njoz9AjkOoLmQwVmQ7aohHdx6+hg1hkjn90L8yKzOlFCmfQJspsz+pFn0
 qzrQ==
X-Gm-Message-State: AOAM5313ANqNs4lkM0wvxBksqqizEslfeOfPpuQq0QbLEJ0YbJFQWpIa
 EcxoYoGAvaavQX5m88+KLDJ2xJ+tpMTliiJsrKDe9MfDC/sgzjdZO3mDSRyIrjLS57KiIlq4VNs
 6X7ZZ3vlT+rPG9Os=
X-Received: by 2002:a1c:1904:: with SMTP id 4mr4710653wmz.93.1629820286501;
 Tue, 24 Aug 2021 08:51:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxqs+2lfPWVB8tf+Y0LN/AdMcHj+yx7umXFqPGGcxo3kkYtofzpnjvDNtQJ+LxkMV2jejGFxw==
X-Received: by 2002:a1c:1904:: with SMTP id 4mr4710634wmz.93.1629820286295;
 Tue, 24 Aug 2021 08:51:26 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 f17sm2689054wmq.17.2021.08.24.08.51.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Aug 2021 08:51:26 -0700 (PDT)
Subject: Re: [PATCH v8 00/34] block: publish backup-top filter
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210824083856.17408-1-vsementsov@virtuozzo.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <82985ebb-91a3-895e-7e0b-ab4fad506338@redhat.com>
Date: Tue, 24 Aug 2021 17:51:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210824083856.17408-1-vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.747,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.305, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, berrange@redhat.com, ehabkost@redhat.com,
 jsnow@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24.08.21 10:38, Vladimir Sementsov-Ogievskiy wrote:
> Hi all!
>
> v8:
>
> 06: add Hanna's r-b
> 07: keep is_fleecing detection in _new() function
> 08,17,18: add Hanna's r-b
> 19: wording, s/6.1/6.2/, add Markus's a-b
> 25: new
> 29: add John's r-b
> 34: new
>
> Patches without r-b: 07, 25, 34

Thanks!  I’ve applied the series to my block-next branch:

https://github.com/XanClic/qemu/commits/block-next

Hanna


