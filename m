Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC40A5171CE
	for <lists+qemu-devel@lfdr.de>; Mon,  2 May 2022 16:43:15 +0200 (CEST)
Received: from localhost ([::1]:48788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlXGc-0006Dr-Kl
	for lists+qemu-devel@lfdr.de; Mon, 02 May 2022 10:43:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1nlXAU-0007bo-7Q
 for qemu-devel@nongnu.org; Mon, 02 May 2022 10:36:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1nlXAS-0002cA-Oa
 for qemu-devel@nongnu.org; Mon, 02 May 2022 10:36:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651502212;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3Z1rseTSigCNqjfG2UzaqOe5GBoDLrEHFWjdvXl/zS4=;
 b=fQITPQRX9ZKNixzNqy0goHUKcyzD+eLIT6sNB94yRrisDAWMX3gVS+NLwMiRnthJCmSL0R
 ncTlKjyhMrcM0IJ75FI/ITRA3Yvf0y4x9BHxfZMEsSWvW3McpDpxSw9id7rKEaMo+tXel1
 SmRLV4CSh8sA+6yYk/5CyMqIA3Im2rE=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-117-ezAmPhjdMK2pmKb7JCqqDg-1; Mon, 02 May 2022 10:36:50 -0400
X-MC-Unique: ezAmPhjdMK2pmKb7JCqqDg-1
Received: by mail-yw1-f199.google.com with SMTP id
 00721157ae682-2f9299dfb81so17723797b3.6
 for <qemu-devel@nongnu.org>; Mon, 02 May 2022 07:36:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:references:mime-version:in-reply-to:date
 :message-id:subject:to:cc;
 bh=3Z1rseTSigCNqjfG2UzaqOe5GBoDLrEHFWjdvXl/zS4=;
 b=u1qpeEAqZ6RPGO572laHkRogBmm2joOXb8DhAST1Ln0n+dr9xD/Td3za544Te+cypt
 Cu0iu8FMwWEVS1nN+B1jSsI4YM2qmH9dc5L5CLTNf16xlTKpGHBx96YdC4fbSEnpNHEY
 Ck6hHYoD/agGY8DJIC0Cos8c5GAapJmo4pX1LsF7yP816FYKzwjJ+JTdnVitYKizvEuz
 IDKUyRozWRVRpf4QH5GxkCWgddfnLVhEbVUPBX2taBmj0ZQL32KvYHpTfjkvprb9ZEsH
 A0VetV91OCJi8sAfsK4gzglJGPxKHoE3o8l+jL/dl667uw37dkoMjH/5AFjmyUXWZk1j
 stGA==
X-Gm-Message-State: AOAM532KZh6wn87ktfzfapNuib4vQqrGp1tjFFyoAcrHBOcCE8Hww/F8
 cAjtBRCFRt0HYlGzrbIgcM15BmulBvzvPPka43KFg+rYpJo+wfDO9ihCxjeqoHXaprmfc5LjaSY
 bID2bZWcbmfvk5+ck47WrCaBifo9RFeU=
X-Received: by 2002:a05:690c:84:b0:2f1:9caa:e4f7 with SMTP id
 be4-20020a05690c008400b002f19caae4f7mr12039884ywb.384.1651502210486; 
 Mon, 02 May 2022 07:36:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxCaJcg9et+JNlhRz6+YghOq/Gi6AOS+/flKLHW4dZU/VF9VCS4HRhX1TXjGBcttTD3GzrYpYHz/q80mmeEnQc=
X-Received: by 2002:a05:690c:84:b0:2f1:9caa:e4f7 with SMTP id
 be4-20020a05690c008400b002f19caae4f7mr12039874ywb.384.1651502210337; Mon, 02
 May 2022 07:36:50 -0700 (PDT)
Received: from 744723338238 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 2 May 2022 10:36:49 -0400
From: Andrea Bolognani <abologna@redhat.com>
References: <20220429154758.354610-1-abologna@redhat.com>
 <8735hsm7ef.fsf@pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <8735hsm7ef.fsf@pond.sub.org>
Date: Mon, 2 May 2022 10:36:49 -0400
Message-ID: <CABJz62OtARwupzSAii5EcaKYO80vSG6wi+yhyBpdvdiFKUKVkg@mail.gmail.com>
Subject: Re: [PATCH 0/7] qapi: Primarily whitespace tweaks
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=abologna@redhat.com;
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Eric Blake <eblake@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-devel@nongnu.org, Yanan Wang <wangyanan55@huawei.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, May 02, 2022 at 02:43:52PM +0200, Markus Armbruster wrote:
> PATCH 1-5 queued, because no-brainers :)

Thanks!

How do you want me to handle respinning 6/7 and 7/7? Send out the
entire series again with those two patches tweaked, wait for your
pull request to make it into the tree, something else... ?

What about the changes you suggested to the commit message of 3/7?

-- 
Andrea Bolognani / Red Hat / Virtualization


