Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D416BD68A
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 18:00:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcqwG-00011V-Lr; Thu, 16 Mar 2023 12:58:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pcqwE-00011H-Po
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 12:58:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pcqwD-00089h-7w
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 12:58:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678985927;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=t4//fT2fPH9OS8xM769NqVGw6D5xDy+bcKSfMAr3Ay8=;
 b=dHBxLkWt/1izo9lFsugeXZqISilOjvZ/cGDpgmjAhizEumdkrFmesQpZe3TH/QiLFE1W4f
 YAr0DDOy1Tcvhe7acKKUs9yWzdmNUJKdZTFeOOUVWkb4VsobqTZpmEvm01RNQ2gFZuvvjq
 6DjwGaOjTHsYvrnmWRRgp2ufh+6hMBQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-623-DPmaV0wZP_2iC9ape1xrBg-1; Thu, 16 Mar 2023 12:58:43 -0400
X-MC-Unique: DPmaV0wZP_2iC9ape1xrBg-1
Received: by mail-wr1-f72.google.com with SMTP id
 u5-20020a5d6da5000000b002cd82373455so428952wrs.9
 for <qemu-devel@nongnu.org>; Thu, 16 Mar 2023 09:58:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678985922;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t4//fT2fPH9OS8xM769NqVGw6D5xDy+bcKSfMAr3Ay8=;
 b=N9H19CeekpIuuYamC4doHdWKQsOW8Q5HvOGPgetBJnYTBcuw+cLFYXZ3ojoXfn3SUo
 FU+Ysuq3S0dtBppJaRwxXGPKvrXyHbpIYxuUXJy0iY3Jx0ulPPRmyyGr7MBde9w6SS5i
 QdCFVgIEUlqO0s5nvOfoq8gNEAySMbHZPgc4B9PkMkKk9r0+VSoBn1REHL7Og0X5EzGO
 VuASJYrEjE3VpTCH3Hi5pBy5lwxry9af0GDxM1u3OjcCTFvIcrd25ieTNipCoCJu1Sjc
 AHvhVSnEOWa1jMjVCFT7tvocG38kQ9mT6EI5tkw96PEbg3nRSwkWEBsYIlIm/fATirBZ
 MR2A==
X-Gm-Message-State: AO0yUKXqhS4fvmeB/xYFYmFdN1vphwUdrMPRRstvhR49hM9UnTthmmo1
 ASXLVql/nIXfW/kdL/qbx3JxIqA/LOAk1uzDmD2mhv12F35TQc4iFjCunWul7VUCdD9uJ+Ft1wL
 BXSLvzi9C59ZVj0w=
X-Received: by 2002:a05:600c:4e8c:b0:3ed:4b0f:5364 with SMTP id
 f12-20020a05600c4e8c00b003ed4b0f5364mr3147719wmq.1.1678985922741; 
 Thu, 16 Mar 2023 09:58:42 -0700 (PDT)
X-Google-Smtp-Source: AK7set+VJXmQHvKlCtqI9I9aP5lTcfvS3KHYsmZIuM81PzlWyM4StBPrAK7vgs4oUoGb7IfiTRHIiw==
X-Received: by 2002:a05:600c:4e8c:b0:3ed:4b0f:5364 with SMTP id
 f12-20020a05600c4e8c00b003ed4b0f5364mr3147700wmq.1.1678985922506; 
 Thu, 16 Mar 2023 09:58:42 -0700 (PDT)
Received: from redhat.com (62.117.238.225.dyn.user.ono.com. [62.117.238.225])
 by smtp.gmail.com with ESMTPSA id
 t18-20020a5d42d2000000b002ceb7a11eb9sm7691026wrr.42.2023.03.16.09.58.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Mar 2023 09:58:41 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: qemu-devel@nongnu.org,  Jason Wang <jasowang@redhat.com>,  Dmitry
 Fleytman <dmitry.fleytman@gmail.com>,  Philippe =?utf-8?Q?Mathieu-Daud?=
 =?utf-8?Q?=C3=A9?= <philmd@linaro.org>
Subject: Re: [PATCH for 8.0 v2] igb: Save the entire Tx context descriptor
In-Reply-To: <20230316155707.27007-1-akihiko.odaki@daynix.com> (Akihiko
 Odaki's message of "Fri, 17 Mar 2023 00:57:07 +0900")
References: <20230316155707.27007-1-akihiko.odaki@daynix.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 16 Mar 2023 17:58:41 +0100
Message-ID: <877cvgljjy.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Akihiko Odaki <akihiko.odaki@daynix.com> wrote:
> The current implementation of igb uses only part of a advanced Tx
> context descriptor because it misses some features and sniffs the trait
> of the packet instead of respecting the packet type specified in the
> descriptor. However, we will certainly need the entire Tx context
> descriptor when we update igb to respect these ignored fields. Save the
> entire Tx context descriptor to prepare for such a change.
>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


