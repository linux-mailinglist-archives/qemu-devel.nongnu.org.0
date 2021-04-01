Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 644F235215B
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 23:12:02 +0200 (CEST)
Received: from localhost ([::1]:47522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lS4bh-0003yn-F7
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 17:12:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lS4aJ-00033q-FO
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 17:10:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28156)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lS4aG-00070b-2X
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 17:10:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617311431;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ji+bmw1lJUDVD2cpzpkVULhUdnemZX/dDkplmuXziCg=;
 b=Uztl/XrPoCpVb2G6QIGg3LzBzwpZUKjEJ3HgcqZ0tHHDFOkAzvjpKcZDWHf4lLBTADboey
 Cg3nOX+tRUu65/4Fhma3rjWm9Cg50AzID8TsBnLRjeE+iw22h4dsfVhlHQ+5TMg0jjCysb
 wEQqqkdLDycYXDoI/pIma/AhWp5rp5A=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-157-HzsLVtZRMD-aY49H6SaQ5g-1; Thu, 01 Apr 2021 17:10:29 -0400
X-MC-Unique: HzsLVtZRMD-aY49H6SaQ5g-1
Received: by mail-ot1-f70.google.com with SMTP id c21so3053505oto.18
 for <qemu-devel@nongnu.org>; Thu, 01 Apr 2021 14:10:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=ji+bmw1lJUDVD2cpzpkVULhUdnemZX/dDkplmuXziCg=;
 b=nx1pXJV91bm701xmNtRLxW4sFMLECnvhqmO3GfGMMk+RxksH51gz/GMNZOimNMuJjB
 hZcSnfyr3BwW8t0dyt5hhX29YwkV64nEOWAK9T2fE87XitAtdlsZw23Zrxk9sNY2WrxC
 Ys4MmHasJTeYllXOcQnbWlGZN8pqMCIZ1yUWCSkYkKF1A0HsOKpvfV7UqFBYDDEufrT1
 JYPi/KFnSee/PhOGLhIbogAeLxS/G2GwsdqUncDTe9Sr3VcpIx77onFeMWHdnT+kE5W5
 CVkKwdqC/n062xS4R2oKRQxl8cpoOaYWrujGCerAiCnxN3fLIeyK2ioG5BtvSG9Bkx0E
 JqVA==
X-Gm-Message-State: AOAM532Qjk7lGKyBHkH1lCJ7cBB8BC+2kQfGnGE0bvTzW3vs3FA9kCqz
 5qf5RKSWmHcfB+sOB1uV+LW4oZVb39LEaN6/7eysr8p4dtvfvhwqrTElgayrLyMc1nB+H4OhDh6
 Jv1SApk8t16oy3Oc=
X-Received: by 2002:a9d:921:: with SMTP id 30mr8502464otp.49.1617311428757;
 Thu, 01 Apr 2021 14:10:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz5N+cgy0uatZmJi/14O5fbKXWCDjG27aFKF5zXYDqS6tZGF8pE4L5bKSEBbTFT3gNChuMN6Q==
X-Received: by 2002:a9d:921:: with SMTP id 30mr8502453otp.49.1617311428611;
 Thu, 01 Apr 2021 14:10:28 -0700 (PDT)
Received: from [192.168.0.173] (ip68-103-222-6.ks.ok.cox.net. [68.103.222.6])
 by smtp.gmail.com with ESMTPSA id
 r10sm1458160ots.33.2021.04.01.14.10.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Apr 2021 14:10:28 -0700 (PDT)
To: qemu-block@nongnu.org
From: Connor Kuehl <ckuehl@redhat.com>
Subject: General question about parsing an rbd filename
Message-ID: <b0c867e5-6ad7-f5e4-ecff-676b3b235995@redhat.com>
Date: Thu, 1 Apr 2021 16:10:27 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ckuehl@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ckuehl@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, dillaman@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

block/rbd.c hints that:

>  * Configuration values containing :, @, or = can be escaped with a
>  * leading "\".

Right now, much of the parsing code will allow anyone to escape 
_anything_ so long as it's preceded by '\'.

Is this the intended behavior? Or should the parser be updated to allow 
escaping only certain sequences.

Just curious.

Thanks,

Connor


