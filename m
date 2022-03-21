Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B544E3247
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 22:21:35 +0100 (CET)
Received: from localhost ([::1]:57290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWPT5-0006TA-0s
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 17:21:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nWPOm-0001LZ-GQ
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 17:17:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58318)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nWPOk-0007vF-0t
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 17:17:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647897425;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KQVTvC12m/hmi25zQSTZxkVX3sUgc2YcRlsrdP9fErQ=;
 b=YuAPKQZBeJ/AJsIs/18VxCeEznIrTzLfIrt5H0eb2cRSuFKy9AZhXhWtgSDRcO+W2xs8d/
 X4Cwnd/He/ZPmJgiynmjI3Ovpogb87F+RtBAJHB5ZHsJUq7jZ1YydLrpgT7xZmj22fYTOq
 4f2FlFFrasZlFQ83eTb31Z2rM5sLdiU=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-186-1o-0hD4xPE6eq5qr5l6qtw-1; Mon, 21 Mar 2022 17:17:03 -0400
X-MC-Unique: 1o-0hD4xPE6eq5qr5l6qtw-1
Received: by mail-vk1-f198.google.com with SMTP id
 e1-20020a1f5001000000b0033e9130ae79so1923387vkb.16
 for <qemu-devel@nongnu.org>; Mon, 21 Mar 2022 14:17:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KQVTvC12m/hmi25zQSTZxkVX3sUgc2YcRlsrdP9fErQ=;
 b=EhpDocsjjJy+yv5rn5wJWFdc4bW8CxWlROEh7iyx1MNnhDJyPVMbq37iwX3t07BT7x
 izG5dQaFFCKt0ZnuwD21TmqPIggiGQtgqwn0xwtbLmnw4gBMJX2QT6ouuwF209Dh1mWK
 E9yLdKWbzAVYJLbVId2aG2xQSbY+hkLVOF1iflHdN/u7leteG1iQymQUra8d7ECLx3VB
 k+0lM9SYHFAjhkUxmBhdsfWan6Cian+6UO1K1ad40qdTugMgatHEsYlIgxIKUzPhJGmQ
 Uhawp1H5PaVY9PyRbJsoYMVkykkHQwK1TQRCg8S5FGeG8L5FLkybSazN8VdzJJ/Psg06
 gdVw==
X-Gm-Message-State: AOAM530W8QHArgwI0x/n4IagiMEdimuuIQibbVX2u3U7Z1qK8N0awDHB
 TN6ZFcTbugJev9L/P994tvayB9nuRXl7GDvlvwoLciI2akYXw5hn5hbVRQxtkBnlmuBIILMMf9O
 hSHj5SBsDhgi6I3pb6pbohsmH7DFAN6k=
X-Received: by 2002:a67:4c3:0:b0:324:ddd7:70d3 with SMTP id
 186-20020a6704c3000000b00324ddd770d3mr5896361vse.61.1647897423138; 
 Mon, 21 Mar 2022 14:17:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyASWb3TjhYS6X4Ku9NdS4ifAo+fkT3T6JY7EnOOFQ+HWhewdfUXo49fcnCn7Z4R40pvhxfQPwJOtqaqxZAZPQ=
X-Received: by 2002:a67:4c3:0:b0:324:ddd7:70d3 with SMTP id
 186-20020a6704c3000000b00324ddd770d3mr5896355vse.61.1647897422950; Mon, 21
 Mar 2022 14:17:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220321203315.909411-1-jsnow@redhat.com>
In-Reply-To: <20220321203315.909411-1-jsnow@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Mon, 21 Mar 2022 17:16:52 -0400
Message-ID: <CAFn=p-b3MZv-JMgaftM3HoxWD30w+w1-=hGeFBUM11mDjKEXYw@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] iotests: finalize switch to async QMP
To: qemu-devel <qemu-devel@nongnu.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Beraldo Leal <bleal@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 21, 2022 at 4:33 PM John Snow <jsnow@redhat.com> wrote:
>
> GitLab: https://gitlab.com/jsnow/qemu/-/commits/python-qmp-legacy-switch-pt1b
> CI: https://gitlab.com/jsnow/qemu/-/pipelines/495951187
>
> This series isolates the iotests-centric changes required to switch to
> the new QMP library. It doesn't do a whole lot!
>
> This is a re-send just being sent for the purposes of aggregating tags
> before pulling it into my Python branch.
>
> John Snow (4):
>   python/machine: permanently switch to AQMP
>   scripts/bench-block-job: switch to AQMP
>   iotests/mirror-top-perms: switch to AQMP
>   iotests: switch to AQMP
>
>  python/qemu/machine/machine.py            | 18 +++++++-----------
>  python/qemu/machine/qtest.py              |  2 +-
>  scripts/simplebench/bench_block_job.py    |  3 +--
>  tests/qemu-iotests/iotests.py             |  3 +--
>  tests/qemu-iotests/tests/mirror-top-perms |  9 +++------
>  5 files changed, 13 insertions(+), 22 deletions(-)
>
> --
> 2.34.1
>

Tentatively staged on my Python branch, thanks.

--js


