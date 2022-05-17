Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B0852AE90
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 01:30:32 +0200 (CEST)
Received: from localhost ([::1]:56208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nr6e8-0002Lt-2O
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 19:30:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nr6ch-0001bX-Np
 for qemu-devel@nongnu.org; Tue, 17 May 2022 19:29:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nr6ce-0000AE-Gh
 for qemu-devel@nongnu.org; Tue, 17 May 2022 19:29:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652830139;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=ffsQ0eg8AQfP8CfFnoSwbEdlDqUYCGu3SNQGmHAErzE=;
 b=ix2TJwYcU9JIUVYm19r6Fsg4IB2DWosCCU6aHNfL3BtZALwCuvtkkq0d11znPq+FJ9djk/
 iR+I18kuaPUOwqrp/ASQ7DVeP0nxwEIVMhh5ELsHVqwADJVVIdknprs2aFtWD6ZowHJtqa
 41RLxJPmA9lLUn4VWQG5N86DilVI1ww=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-346-JrSRWGtcNvyWdzgA5oR7oQ-1; Tue, 17 May 2022 19:28:50 -0400
X-MC-Unique: JrSRWGtcNvyWdzgA5oR7oQ-1
Received: by mail-ua1-f72.google.com with SMTP id
 q14-20020ab06c4e000000b00365e0c0d75eso356520uas.1
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 16:28:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=ffsQ0eg8AQfP8CfFnoSwbEdlDqUYCGu3SNQGmHAErzE=;
 b=rCTkcjKJLt2WS03yYoKcDJnCLSEvlX+zkIM/IjLdJH0mOqCjL0zqXYweGGDxEVBUCY
 2E1tgkF+zjFTT1uFmIsmiQX4Yx4+za5liOjOr0XZbDLFP6gtsEMbpnwIUNAA9qrMriaW
 hXrc2k4UicAVO7gFig1+g/ngnxgUNplFdxiwicDX3Ppa9LrwDNkMg03LvqA2kz1IKkk6
 3tNLcn1q39v4WzEWWfCHPsktB1W1NqTfe5j+1qinimzSfZrbfH2X2rUr40vW8Gws+H0T
 nvZyXwNlx5TRya0QXTAirVXbVxpYoIKdT79CaQaR7+xgI9+13qN2LwIyceKieP+UcRnD
 8zlA==
X-Gm-Message-State: AOAM5333P5dNa7v/+Xe2BoRaljpXzEX+pBoyRXMMd3tNWzgV58SnlAr5
 hGZP2sa7KHXaY7YrZhzNrX9g5mb9IfLPAQ4bkTXdYXlLmwsUXY/JMGH4kD9POgOMeV7LuPF5rFv
 PtuUM5PTEsuQSq0++Sz6G3DK6FjNfB2k=
X-Received: by 2002:ab0:67cf:0:b0:341:257f:ce52 with SMTP id
 w15-20020ab067cf000000b00341257fce52mr9804944uar.109.1652830130239; 
 Tue, 17 May 2022 16:28:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwb3V9StGPhh0fs/rTANQFHMbw8JbT3LyqTNzTgKNSOjYMX1tanLejbpJmgvRQlR9yy2J382TBuFrpq9kNugCI=
X-Received: by 2002:ab0:67cf:0:b0:341:257f:ce52 with SMTP id
 w15-20020ab067cf000000b00341257fce52mr9804937uar.109.1652830129992; Tue, 17
 May 2022 16:28:49 -0700 (PDT)
MIME-Version: 1.0
From: John Snow <jsnow@redhat.com>
Date: Tue, 17 May 2022 19:28:39 -0400
Message-ID: <CAFn=p-aEc=uWyGi2758wDwJF=St4ZThkvuDqVXoxTtcHLFZkhA@mail.gmail.com>
Subject: The fate of iotest 297
To: Kevin Wolf <kwolf@redhat.com>
Cc: Hanna Reitz <hreitz@redhat.com>, qemu-devel <qemu-devel@nongnu.org>, 
 Qemu-block <qemu-block@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Kevin,

I remember that you wanted some minimum Niceness threshold in order to
agree to me removing iotest 297.

I've already moved it onto GitLab CI in the form of the
check-python-pipenv job, but I recall you wanted to be able to run it
locally as well before agreeing to axe 297. I remember that you didn't
think that running "make check-pipenv" from the python directory was
sufficiently Nice enough.

Do you need it to be part of "make check", or are you OK with
something like "make check-python" from the build directory?

I have a bit more work to do if you want it to be part of 'make check'
(if you happen to have the right packages installed), but it's pretty
easy right now to give you a 'make check-python' (where I just
forcibly install those packages to the testing venv.)

--js


