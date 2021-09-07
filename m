Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FFE840234E
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 08:18:58 +0200 (CEST)
Received: from localhost ([::1]:53336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNURd-0005rU-Nk
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 02:18:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mNUPz-0004oQ-Uh
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 02:17:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mNUPy-0000B1-IY
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 02:17:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630995434;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g5LMbxaYQTPsnz6CsNmrHaShIEuyXYW1sUonCUEZgsw=;
 b=Ie2fj/Dsaad3zeHhodyREUj9+CcqRtGpoIw5UQiURr1wzZ975Z6V7L2jRAMmUFKz4QXVGS
 aHcgVVcY/CbonzqhE15TcX90qBGBaD0dcNyUWxnI7/+VMawHQdQPCXBMLDpXm1qebthTUd
 M3vqUKB4+rdNEfmfCgr1u76BgJcKbXY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-315-Sia6lP8gNVyRXteJcH9EAA-1; Tue, 07 Sep 2021 02:17:11 -0400
X-MC-Unique: Sia6lP8gNVyRXteJcH9EAA-1
Received: by mail-wm1-f70.google.com with SMTP id
 u14-20020a7bcb0e0000b0290248831d46e4so694477wmj.6
 for <qemu-devel@nongnu.org>; Mon, 06 Sep 2021 23:17:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=g5LMbxaYQTPsnz6CsNmrHaShIEuyXYW1sUonCUEZgsw=;
 b=TRNtNlAKz5H+TCanXe0zFC9SbzgRwYZT8f23TsSOXFjt2qhAh43IskgYhqxRp2t9vR
 LjVtX/ZV8uF24fYTdQk97mWFnjP/KN2X0qkzfE8wBsJt53rU4bcTYECWq1OqagJJikcu
 U0PHc2fSlsl/ZKiEPZPuppUvddY83zsLDviSsTX16e3euV8HmgFDjC42wax6YxhukinD
 LL9xKiHUE2109K18uPcFvO5Wv8hs5n3E6yqb0rWgIfEbwy+VHvq7kldfK69gB04txsVC
 /SNiI+0RCGAkXxyw0sb08dPoWz2RDZX0AHsXWsNWgEzqnQonHAs8dwxeehDlf+5NHXPN
 UZ0Q==
X-Gm-Message-State: AOAM5321R0H5Du09MSooSvEXa/60u48AWOVfhThZCyK5JoDC2C60Glag
 8prbOUbzTbhudZ/yxiisSTr6o6Z/k/IJXvm+ZlmYOvQoXLYCK8J/VFRTwyBkN1NwKgMgQtORoPg
 exCbOgHiOP6/JAJc=
X-Received: by 2002:a1c:f414:: with SMTP id z20mr2211149wma.94.1630995430728; 
 Mon, 06 Sep 2021 23:17:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyLtpjmBZkwigCrJQb9WPvgxSy3kXX+r+mEcz3AsshZqkZRdxxjZ9Cf+nxWR+vxo+Bl4Eaarg==
X-Received: by 2002:a1c:f414:: with SMTP id z20mr2211115wma.94.1630995430384; 
 Mon, 06 Sep 2021 23:17:10 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id o7sm1332443wmc.46.2021.09.06.23.17.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Sep 2021 23:17:10 -0700 (PDT)
Subject: Re: [PATCH v3] qemu-sockets: fix unix socket path copy (again)
To: Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
References: <20210901131624.46171-1-mjt@msgid.tls.msk.ru>
 <CAJ+F1CLcSZ_zE8oMZz3k_WCSOvf50hapGCu-dfSd9RxzzVhumA@mail.gmail.com>
 <165d60fd-c91e-7b03-3ec1-21f50760ec05@msgid.tls.msk.ru>
 <8929531a-c763-f01b-4a3a-70c1a0dd97cd@redhat.com>
 <e93958d0-3015-c490-64e9-261dabc6b301@msgid.tls.msk.ru>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <c89046ba-687c-bb64-7dc5-91541d3802dd@redhat.com>
Date: Tue, 7 Sep 2021 08:17:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <e93958d0-3015-c490-64e9-261dabc6b301@msgid.tls.msk.ru>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.332, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 QEMU <qemu-devel@nongnu.org>, qemu-stable <qemu-stable@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/6/21 1:39 PM, Michael Tokarev wrote:
> 06.09.2021 14:34, Philippe Mathieu-Daudé wrote:
> 
>> Certainly, but you could also pick the latest patches
>> sent to qemu-trivial@ already reviewed ;)
> 
> I haven't done this in years..

Not sure what that means... you are still listed as
maintainer:

Trivial patches
---------------
Trivial patches
M: Michael Tokarev <mjt@tls.msk.ru>
M: Laurent Vivier <laurent@vivier.eu>
S: Maintained
L: qemu-trivial@nongnu.org


