Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C214150A6E6
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 19:18:16 +0200 (CEST)
Received: from localhost ([::1]:34358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhaRb-0001wF-SY
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 13:18:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nhZxS-0007iE-MC
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 12:47:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21482)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nhZxO-00045C-Af
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 12:47:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650559621;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=XToyQ4LqCwrnZIwfVKVtwi7LMf7Pg8dyVM/qzWcV1/g=;
 b=H9ibOYgzHVGmz8h8Juloy9eO81NvM6xC52HfuUHbLVm2WR/vZs0X78JSgwWYLPVmUDXUe8
 vivNjJCu2Ui7b/KVezO7KjuRUf5TgHwupkQSO0remVXM6jWQPw2OaDnpk7ZCjAzbQInute
 0eCMmJ8Fk6nGhdvZq+clfm/LJz1J32Y=
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-383-A26xCfjgNbaCsowBemRh_w-1; Thu, 21 Apr 2022 12:47:00 -0400
X-MC-Unique: A26xCfjgNbaCsowBemRh_w-1
Received: by mail-vs1-f70.google.com with SMTP id
 i13-20020a67eccd000000b0032863916491so397029vsp.11
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 09:46:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=XToyQ4LqCwrnZIwfVKVtwi7LMf7Pg8dyVM/qzWcV1/g=;
 b=m8Jl0JPhCjOa3GjY62NzmOaYZKKDZX4z+ascZVw43ofyJKpOTUHdx+k/luWg1ju2ui
 jpI6RlJHjlRMliAlKr86gQO2/2rDB+yk+5giIXauG7Nwn2TuzxT7+zppVA9hdqFBqUUz
 7YHq6yUoJpgYQFBZjRXGmNs+4kPB6SKW1RMVOiMh8SVqCtKBDZGAxL7U8IO22W4dlgbC
 m0ZUI22MaWsug5m9EUphzXUE0mRw4wOx6+QxSnRg8ZbmnhQSWmg8NKPi6wV+FM1PEXQc
 cSFVaQOqwtyXasws4FedS0XMZhwUKvS2Q/0yG5EN4dGd6eJ3+7JHTyR6E2nxc+Ya3aXc
 y9iQ==
X-Gm-Message-State: AOAM5329OnbOU3ZB4SIF4SozRNlKbJ3cLeU8+8xYhZG6dN7DFfecpSBb
 pgvM7ZJo0ZbwACzIcTsho3NMM6biHa/Bvf+WHkVP3KXhJiNcopzIv0EqpsDCWYfWvdKbv5nfwES
 chU3qn6amye/3eiFX4fefRcqHt4dkwaY=
X-Received: by 2002:a1f:1257:0:b0:349:a15f:30c with SMTP id
 84-20020a1f1257000000b00349a15f030cmr255901vks.26.1650559619203; 
 Thu, 21 Apr 2022 09:46:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy9976a/hG98AoeeQ0aYtCqP6slKPLm1skLIys1VDZLrl47E9vUu8GXAT+3WUvdZTFSQ1T0k/btJYCakAjrw/s=
X-Received: by 2002:a1f:1257:0:b0:349:a15f:30c with SMTP id
 84-20020a1f1257000000b00349a15f030cmr255888vks.26.1650559618997; Thu, 21 Apr
 2022 09:46:58 -0700 (PDT)
MIME-Version: 1.0
From: John Snow <jsnow@redhat.com>
Date: Thu, 21 Apr 2022 12:46:48 -0400
Message-ID: <CAFn=p-a1DTR3ve_aQBARLG6NDdGscWQOn1wCjrPiRWL0sDvk9A@mail.gmail.com>
Subject: Create qemu-project/py-qemu.qmp repo
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Daniel Berrange <berrange@redhat.com>,
 Victor Toso de Carvalho <victortoso@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Andrea Bolognani <abologna@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Alex: do you have the ability to create a blank/empty "py-qemu.qmp"
repo under the qemu-project grouping, and add me and Cleber as
maintainers for it? There weren't any objections when I floated the
idea [1].

(Though I suggested "py-qemu.qmp" and Dan suggested "python-qemu.qmp".
I don't think we explicitly reconciled the difference. I like the
shorter one.)

After my most recent Python PR is merged [2], I'll be just about ready
to go on pushing a fork of this library into its own repo [3], so I
think it's time to actually create the repo. I intend to re-spin that
fork patchset [3] (updating the URLs involved) and see if there are
any final comments, then push to the new repository.

[1] https://lists.gnu.org/archive/html/qemu-devel/2022-02/msg00979.html
[2] https://patchew.org/QEMU/20220421151600.984189-1-jsnow@redhat.com/
[3] https://lists.gnu.org/archive/html/qemu-devel/2022-03/msg07176.html

Thanks,
--js


