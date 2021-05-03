Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD8AA3713E3
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 12:58:11 +0200 (CEST)
Received: from localhost ([::1]:58334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldWHC-0008Ey-OD
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 06:58:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ldWFw-0007oE-FT
 for qemu-devel@nongnu.org; Mon, 03 May 2021 06:56:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51065)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ldWFu-0002DP-Ow
 for qemu-devel@nongnu.org; Mon, 03 May 2021 06:56:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620039409;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZHu4GTlzAheU1rSrgsBHuXeL1IjIlLXBsLBiF/wMUi0=;
 b=SQcCpD97OQ291UucQ7rCfl2zNbYkcjFs5hSUC6H8ZcIeN2geT4csxLBJaRPX53mjzVKOS2
 A9lcq94ait25BuCfHVyDomy0/aG+I2KsU18fKdjpsqI+luEHvsU7gpIs5Rb3QYEXyqLm0K
 zhdRe/4Wz+6sYkGE+A5zW48MYNgAID8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-544-71O_4n0oMP2gyfmj3ELqqA-1; Mon, 03 May 2021 06:56:48 -0400
X-MC-Unique: 71O_4n0oMP2gyfmj3ELqqA-1
Received: by mail-wr1-f71.google.com with SMTP id
 s7-20020adfc5470000b0290106eef17cbdso3687861wrf.11
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 03:56:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZHu4GTlzAheU1rSrgsBHuXeL1IjIlLXBsLBiF/wMUi0=;
 b=GkQns14ETLWoTp+NLA7adb2HSgMMczuL7Tb8mSdBhI/FcyXVa7xwvoB/WmbTkKOSio
 7Z+F9yvd/dEKx9Mb1le8UmPhFlgyIJZIDqMXS2ecNm6uFBmEvrx5g7W01onTkznabil8
 dyIdGMhsyLXeQItsQUyRMgucEm+YjKPP7rc/1+sjw9h18KXhcLWNIax2NakjZIPA3RDL
 bAAQCDGD54bcXbVPRUhWVtekKacOH9ThfKfExiGfQj4O8SK2KhzRMoB4G1t/e318oqHq
 hd1EMUcuf/v60jaTN20bMmJucDYEwU8QgksUI6In/VTMinZv6U/CLJNzKE9qWdojOWUW
 a/NQ==
X-Gm-Message-State: AOAM531qwg67WAepHOaJp3qZ97YQY5uAOraxtBnptqehTFT2KI7hAVAx
 ccggzcmO3xlzGtcr2Q0SSScANpttLpMehYoUujkp8zEUvaEII8CzVdPK95UizpSzOpxWC56zGrZ
 +rl1bx1QPk/k3tYc=
X-Received: by 2002:adf:f38c:: with SMTP id m12mr18689368wro.282.1620039407153; 
 Mon, 03 May 2021 03:56:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxLNR8cRglp7p+T0TsMFFzsr7F1FrZ5dNJ2PS/5j7iUrE78gG2l1dwB06fsvc47hXdCc6sUWw==
X-Received: by 2002:adf:f38c:: with SMTP id m12mr18689357wro.282.1620039406991; 
 Mon, 03 May 2021 03:56:46 -0700 (PDT)
Received: from thuth.remote.csb (p5791d0bc.dip0.t-ipconnect.de.
 [87.145.208.188])
 by smtp.gmail.com with ESMTPSA id e10sm11982934wrw.20.2021.05.03.03.56.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 May 2021 03:56:46 -0700 (PDT)
Subject: Re: [qemu-web PATCH] Update website to point to the new bug tracker
 at GitLab instead of Launchpad
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20210503103007.1034171-1-thuth@redhat.com>
 <92c95d95-dd59-4e52-ee14-a6b3925d43e0@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <0cc06563-a543-fcdd-0fe3-c5a6eec4c514@redhat.com>
Date: Mon, 3 May 2021 12:56:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <92c95d95-dd59-4e52-ee14-a6b3925d43e0@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/05/2021 12.47, Philippe Mathieu-Daudé wrote:
> Hi Thomas,
> 
> On 5/3/21 12:30 PM, Thomas Huth wrote:
>> We've started migrating the bug tickets from Launchpad to GitLab, so
>> it does not make too much sense anymore that users open new tickets
>> in the old system. Let's direct them now to the GitLab tracker instead.
> 
> We should document the user has to request a Gitlab 'Reporter' access to
> the project, and warn there might be a delay of some days before the
> request to be accepted, before the user be able to fill the bug.
>
I think it is possible for everybody with a Gitlab account to file bugs. We 
already have two tickets that were created by non-members:

  https://gitlab.com/qemu-project/qemu/-/issues/47

  https://gitlab.com/qemu-project/qemu/-/issues/45

AFAIK, you just need the "Reporter" state if you want to add labels to a 
ticket, or if you want to assign it to somebody else.

  Thomas


