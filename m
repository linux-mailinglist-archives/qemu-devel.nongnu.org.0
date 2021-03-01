Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FEB0329541
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 00:38:52 +0100 (CET)
Received: from localhost ([::1]:42458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGs7n-0003po-7B
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 18:38:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lGs5H-0002Zh-CB
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 18:36:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59036)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lGs5E-0007ji-3S
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 18:36:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614641770;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=CwpL2VtFz1lhubSsYq9p/H7EACS3JsRSK13u7ALu3+s=;
 b=d/6zT+DxftueAl6zP8I3HIhER5Yem2y8LjtLbJAL1HRup3QsavK6PGGVh6bZZyxbvy8CJE
 kmqluD+JItIp+J1GX9DygJdN426vQpuJBNNj+hSsiEe3R/PX+D0ZKDBT8jgOldK4HDC6Og
 gjmpdIzQVtSegqwAEA5ifgDJ8oaqkHI=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-40-NYHmaVlsNlevul2UhrfO4Q-1; Mon, 01 Mar 2021 18:36:09 -0500
X-MC-Unique: NYHmaVlsNlevul2UhrfO4Q-1
Received: by mail-oi1-f200.google.com with SMTP id a128so9695250oii.12
 for <qemu-devel@nongnu.org>; Mon, 01 Mar 2021 15:36:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CwpL2VtFz1lhubSsYq9p/H7EACS3JsRSK13u7ALu3+s=;
 b=mPjZtY1wMBqbC8G/IVcYcZIzM12HcdFTwsv6o0omTr4zb00Ka0FhX1fa8klWU3NpC9
 vlnl+zfpIH+pmxElDaRWAOaopEpp7tFaiht6FQWVfJnHUe+EqcEvGdbNWMW98T8TYiLW
 eRzgm5aO2XnjWZpYVYwJtm9b2nVC4TOBlj1tQJz6tgRWNmEve0p4ajI3HzMqbNEFc1Uw
 WutkE8wwKbKcguKiLC3XHggrUqpQSRD1pqW5o5bBkeVm3A91VmuGtWpH+3MX++s8c3VR
 k9aMqspxczjXPMI1PCMgvcmRoQ7ubslvTNJOtnMBDdZyDLSIVZRVAs5d7vmkjamHHP6i
 wR9w==
X-Gm-Message-State: AOAM532XvWnxlQCvp3w0c3vfEZwXY0IzK5D97S7zgEvHVLhCSXuWeyXt
 m8I431VEZE1BIuJ73HDW7voQkFoX4xaoM0q2WOaFA/YMEa1FzykXK5j5w9RjyfC2AlTKVi03C8/
 ShLgGayR9mU7OyW0=
X-Received: by 2002:aca:4486:: with SMTP id r128mr1084497oia.171.1614641768592; 
 Mon, 01 Mar 2021 15:36:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxoXFT4m7AQYlXaCTpGFV05EmwaA19hXL9mKwh6vvvPs+NwnvYtPEpmakpEd5Mdb2NN618qxg==
X-Received: by 2002:aca:4486:: with SMTP id r128mr1084492oia.171.1614641768438; 
 Mon, 01 Mar 2021 15:36:08 -0800 (PST)
Received: from redhat.redhat.com (ip68-103-222-6.ks.ok.cox.net. [68.103.222.6])
 by smtp.gmail.com with ESMTPSA id a12sm4087885otp.30.2021.03.01.15.36.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Mar 2021 15:36:08 -0800 (PST)
From: Connor Kuehl <ckuehl@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 0/2] Clarify error messages pertaining to 'node-name'
Date: Mon,  1 Mar 2021 17:36:05 -0600
Message-Id: <20210301233607.748412-1-ckuehl@redhat.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ckuehl@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ckuehl@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, armbru@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some error messages contain ambiguous representations of the 'node-name'
parameter. This can be particularly confusing when exchanging QMP
messages (C = client, S = server):

C: {"execute": "block_resize", "arguments": { "device": "my_file", "size": 26843545600 }}
S: {"error": {"class": "GenericError", "desc": "Cannot find device=my_file nor node_name="}}
                                                                               ^^^^^^^^^

This error message suggests one could send a message with a key called
'node_name':

C: {"execute": "block_resize", "arguments": { "node_name": "my_file", "size": 26843545600 }}
                                               ^^^^^^^^^

but using the underscore is actually incorrect, the parameter should be
'node-name':

S: {"error": {"class": "GenericError", "desc": "Parameter 'node_name' is unexpected"}}

This behavior was uncovered in bz1651437[1], but I ended up going down a
rabbit hole looking for other areas where this miscommunication might
occur and changing those accordingly as well.

[1] https://bugzilla.redhat.com/1651437

Connor Kuehl (2):
  block: Clarify error messages pertaining to 'node-name'
  blockdev: Clarify error messages pertaining to 'node-name'

 block.c                    |  8 ++++----
 blockdev.c                 | 13 +++++++------
 tests/qemu-iotests/040     |  4 ++--
 tests/qemu-iotests/249.out |  2 +-
 4 files changed, 14 insertions(+), 13 deletions(-)

-- 
2.29.2


