Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1D4297E49
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Oct 2020 21:58:31 +0200 (CEST)
Received: from localhost ([::1]:38238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kWPgM-0004A0-Vw
	for lists+qemu-devel@lfdr.de; Sat, 24 Oct 2020 15:58:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kWPeX-0003GY-PF
 for qemu-devel@nongnu.org; Sat, 24 Oct 2020 15:56:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53473)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kWPeW-00009P-1M
 for qemu-devel@nongnu.org; Sat, 24 Oct 2020 15:56:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603569394;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aB2Mpu37smhTRlQAtipf/Ovb+kZwYU6SCTtGiusn4ho=;
 b=YnTPEah8i/LZgOgLjD2DiweEnqNlnYMg8XKiwihzfLmSBcgCzrsBlSInBARXn2sCf0EDJk
 q6t1grOqZ6C5P36pFRSzU7KkMbWpKghwgzkkOPLbhByvIl5LIhhb27+R+kiV5P+7925T44
 bgFb943ejDarFL4sWvpVm7DEJmR5WJs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-492-2ZmIXxV2PhGLsY_GzfGHJA-1; Sat, 24 Oct 2020 15:56:33 -0400
X-MC-Unique: 2ZmIXxV2PhGLsY_GzfGHJA-1
Received: by mail-wm1-f71.google.com with SMTP id s12so2030688wmj.0
 for <qemu-devel@nongnu.org>; Sat, 24 Oct 2020 12:56:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aB2Mpu37smhTRlQAtipf/Ovb+kZwYU6SCTtGiusn4ho=;
 b=rWOO4OzGgeMEXNouCgg9A7CZIFvY7gHcOeT1juL5/qKWMvU9Tek5jAbryursiM4iER
 5IogPR5FY35JuTnqOEGEsXEp0kVLhkT5g1/eRzRJNhr+W1T8Ko7by+TWJP4/ifCSRE6n
 oudhIpZvpmyCgifgzjeGoMMQDKtOe1j892oavJ/bWai5zJKYruWRD4yGEDQr28ajdaJ3
 PXJbbUwob0FIKzGITv+m6TPKDahk8dyAQLfE+6T8QRtiUlR8Zdel3/Wrda5Yh33Z+tDE
 Ciart3H9qIlDcs9rpFfGKtyM4f1hsPvPMw/Hwt/7CphVQZO2WOyqY2OcQfdJFwbnRcNv
 eX9g==
X-Gm-Message-State: AOAM5311l7fBYtgMvdUuOpQLeisw36crpw49gqDIWAtC51NApbRc65im
 L5IY1Nbruxabe3qQZf0qY3c603k7e/orAk1/nWkYYQ1SFVEECAvCB1trERmiz8Ffin4NimZV3Gg
 zwZiIvtT8Fep0TK4=
X-Received: by 2002:adf:c50c:: with SMTP id q12mr8962888wrf.17.1603569391789; 
 Sat, 24 Oct 2020 12:56:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxgz5WmF3PWuxkJVZLQUpu1BvCMuSoaB2j+fKdRxP9jcVNWEYJVhbd4aW7zgU79X46xGwNiTQ==
X-Received: by 2002:adf:c50c:: with SMTP id q12mr8962881wrf.17.1603569391633; 
 Sat, 24 Oct 2020 12:56:31 -0700 (PDT)
Received: from [192.168.1.36] (237.red-88-18-140.staticip.rima-tde.net.
 [88.18.140.237])
 by smtp.gmail.com with ESMTPSA id 78sm11895253wmb.32.2020.10.24.12.56.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Oct 2020 12:56:30 -0700 (PDT)
Subject: Re: [PATCH 13/15] scripts/qom-fuse: move to
 python/qemu/qmp/qom_fuse.py
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20201021185208.1611145-1-jsnow@redhat.com>
 <20201021185208.1611145-14-jsnow@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <78e94042-8b21-9aa9-87ed-0398be640759@redhat.com>
Date: Sat, 24 Oct 2020 21:56:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201021185208.1611145-14-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/24 15:43:56
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.107, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: Cleber Rosa <crosa@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/21/20 8:52 PM, John Snow wrote:
> Move qom-fuse over to the python package now that it passes the
> linter. Update the import paradigms so that it passes.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   scripts/qmp/qom-fuse => python/qemu/qmp/qom_fuse.py | 12 ++----------
>   1 file changed, 2 insertions(+), 10 deletions(-)
>   rename scripts/qmp/qom-fuse => python/qemu/qmp/qom_fuse.py (95%)
>   mode change 100755 => 100644

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


