Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 989FC6F5A74
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 16:55:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puDrg-0004bh-PC; Wed, 03 May 2023 10:53:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1puDre-0004ay-6D
 for qemu-devel@nongnu.org; Wed, 03 May 2023 10:53:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1puDrc-0002ra-Pv
 for qemu-devel@nongnu.org; Wed, 03 May 2023 10:53:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683125631;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=1fo2rYDOzUGi7C1R3NgoU6ROKzEeNvzLAHDiHXpZ2/o=;
 b=fMnas3ZpeOrXnBWCHEb/ICvSmcAD8tKpKi8XDV8tNY++1+w1sFinE3AjuFvOauDYaMWzPH
 UqUXI3N9G74DirriOPgYaSxa+0Y/fHopE22gih954Lw9lrpBTxAB1jquI1xU1VqU8MJBoL
 1CsKkG+uZTaH0G6+2BYcVjkjsfPVs5A=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-631-3QSgEuI1Nay9hq8llrvS3g-1; Wed, 03 May 2023 10:53:50 -0400
X-MC-Unique: 3QSgEuI1Nay9hq8llrvS3g-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-30479b764f9so1532155f8f.0
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 07:53:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683125629; x=1685717629;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1fo2rYDOzUGi7C1R3NgoU6ROKzEeNvzLAHDiHXpZ2/o=;
 b=EOWGaDeZm4x+yDicXaEJveeIgO+yvmgwShfFQO4xQZRNaDCUPu63eV/xmuFJZELn0d
 ZNtzQzjoGASUmlpKyHLtp5NfMkM75SPP1ik7vq2QzP9K8iNPLNEvTJWEoEm/8wjggQ1b
 nWVxxf2ftpfbj8xXUxq1gwq0mRfwVQ1iH9Odz7wz8rD77oGpoUjz7MJ7eX+i/X4L8wle
 oot+u9v0Bk8Orrhig3NwoNnZtjC0qm9DBa1KvlGxa5afhJYYOuKHg5BP1anzF/JxI9nZ
 x10ddHOcY2+UBhmIPLOwuCCAvfdVuslk+Ga6FQU3ZdcZ2JXOSG/QbppAHLyo60a6R/zc
 XgAA==
X-Gm-Message-State: AC+VfDz9A5KxgZHWSdVv5glGojkEZJh251YsEmoqQ2tbzj/qWdNIyC3e
 REk5QhW1AE6ASbtyWPFcGmUNseiWRXzsMYYdxfM1F3TNvosadwppEZMMR6XgnnLDFFdSVWyV/FK
 CdcHYt4PIU/2lMvI=
X-Received: by 2002:a5d:5588:0:b0:2f5:930:39b1 with SMTP id
 i8-20020a5d5588000000b002f5093039b1mr212635wrv.38.1683125629489; 
 Wed, 03 May 2023 07:53:49 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6LoabhU3EGB9imjQpNDa/5wokk3Mvk6k2ZBjJEgIwp3WBNbUg1XeYifpNH0sbtD4NxBFzE7A==
X-Received: by 2002:a5d:5588:0:b0:2f5:930:39b1 with SMTP id
 i8-20020a5d5588000000b002f5093039b1mr212618wrv.38.1683125629191; 
 Wed, 03 May 2023 07:53:49 -0700 (PDT)
Received: from redhat.com (static-92-120-85-188.ipcom.comunitel.net.
 [188.85.120.92]) by smtp.gmail.com with ESMTPSA id
 l20-20020a1ced14000000b003f182cc55c4sm2134635wmh.12.2023.05.03.07.53.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 07:53:48 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-devel@nongnu.org,  qemu-block@nongnu.org,  Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,
 Eric Blake <eblake@redhat.com>,  Peter Xu <peterx@redhat.com>,  John Snow
 <jsnow@redhat.com>,  Yanan Wang <wangyanan55@huawei.com>,  Stefan Hajnoczi
 <stefanha@redhat.com>,  Leonardo Bras <leobras@redhat.com>,  Fam Zheng
 <fam@euphon.net>,  Eduardo Habkost <eduardo@habkost.net>,  Vladimir
 Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Subject: Re: [PULL 11/18] migration: Create migrate_block_bitmap_mapping()
 function
In-Reply-To: <ZFJw1lSMcQ5sqZBD@redhat.com> (Kevin Wolf's message of "Wed, 3
 May 2023 16:33:58 +0200")
References: <20230427152234.25400-1-quintela@redhat.com>
 <20230427152234.25400-12-quintela@redhat.com>
 <ZFJw1lSMcQ5sqZBD@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 03 May 2023 16:53:44 +0200
Message-ID: <87jzxpqxdz.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Kevin Wolf <kwolf@redhat.com> wrote:
> Am 27.04.2023 um 17:22 hat Juan Quintela geschrieben:
>> Notice that we changed the test of ->has_block_bitmap_mapping
>> for the test that block_bitmap_mapping is not NULL.
>> 
>> Signed-off-by: Juan Quintela <quintela@redhat.com>
>> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
>> 
>> ---
>> 
>> Make it return const (vladimir)
>
> (I don't think this part was actually meant for the commit message)
>
> This commit broke qemu-iotests 300 on master. Please have a look.
>
> Kevin

grrr

selfNack

Just wondering, make check don't run this?

I run "make check" before I sent the pull request.

Later, Juan.


