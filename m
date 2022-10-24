Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC0E60ADFF
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 16:43:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omy8d-00088a-M1; Mon, 24 Oct 2022 10:09:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1omy8c-00088Q-1G
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 10:09:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1omy8a-00032x-OC
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 10:09:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666620547;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PqbrAjUxO9P29pd1ffO7UWbLwjNbMdtuAATUchkPNkQ=;
 b=XEbeDA/2ngLe+JXCVKjpPnLM4IBY+mfBOfINp/+EZVO9Gga3Jc23V0belQIKsW4Ks53Dqu
 GThjPoNB63pnHsSx647Yhe+FuOYgJoq5xza1HtQVoCD8HdQ2xWsY5IfUo2XnD28rfTjSzW
 S0BS8VtnPaI6xFkWmWX92r+XXPeQtd4=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-382-wqGRjKEqPkiZRCNc4J_kOA-1; Mon, 24 Oct 2022 10:09:06 -0400
X-MC-Unique: wqGRjKEqPkiZRCNc4J_kOA-1
Received: by mail-ed1-f70.google.com with SMTP id
 dz9-20020a0564021d4900b0045d9a3aded4so9934010edb.22
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 07:09:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PqbrAjUxO9P29pd1ffO7UWbLwjNbMdtuAATUchkPNkQ=;
 b=GH8B8C3dtTJ4eWUnqppz+Nh6YZ6mDLYLaAEoSDbG+U8GAHbHlKaAl8W5aQEc6fkn3R
 IrIn4AgW73gPgRT535odsi8EysX91LjOKx4skBk4djknRQ8//baMf3Hn8ypiZJEiNkaf
 lK2tBZne9XI+lenxy915RhncVOcKibZtT8ZYkHLBsJsldWzubn8ItaW6qDmeyDoJrQgn
 MB8YA/QnVBGqT+2MVQqK4aRn7SsW4GrEGaV5YR+CJ7N1gofdoStElhh0VQzpFsran0u2
 4n/JPi82L8cSEdxhBj6oRKHItl741o8yPZF6FTgSu170UiWphXhFG1dN2Ou3jqcbCQ1A
 GPtA==
X-Gm-Message-State: ACrzQf1rrwVaIhveLTeuWf0b/NHHDQIM3NfcnVsaIOvu7G4IC9bbLi2x
 ZY55+mDksWSUIJ3Y56gHRFkVbKd/SzR7Mjo3JT6idU2BnNZE433Ozfpm1ChjkHYS08410L8R7R4
 ++VmFaFK4itSnUQXBBryufRJmClefIJQ=
X-Received: by 2002:a17:907:7294:b0:7a9:8a22:74d4 with SMTP id
 dt20-20020a170907729400b007a98a2274d4mr2958079ejc.139.1666620544964; 
 Mon, 24 Oct 2022 07:09:04 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6Gx3LBJ58mXjin5zc/V9Nj3qh3ahml+dMvECLzJEMotMLvD4BoByHxuWjG+4HkGz7ROGMXRjllFcbmhbHKorQ=
X-Received: by 2002:a17:907:7294:b0:7a9:8a22:74d4 with SMTP id
 dt20-20020a170907729400b007a98a2274d4mr2958062ejc.139.1666620544786; Mon, 24
 Oct 2022 07:09:04 -0700 (PDT)
MIME-Version: 1.0
References: <CA+PPyiEvbs0-Pn0ndthWL=Q5Q4ArN7P4Lu-26UHWf+7O3KG5eA@mail.gmail.com>
In-Reply-To: <CA+PPyiEvbs0-Pn0ndthWL=Q5Q4ArN7P4Lu-26UHWf+7O3KG5eA@mail.gmail.com>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Mon, 24 Oct 2022 16:08:53 +0200
Message-ID: <CAGxU2F4HtO1RJEvS5iP25LNak80V5OqJKt3VHMv_f9c9RL21BQ@mail.gmail.com>
Subject: Re: [OUTREACHY] Asking about contribution ideas
To: NSENGIYUMVA WILBERFORCE <nsengiyumvawilberforce@gmail.com>
Cc: ming.lei@redhat.com, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.503,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Wilberforce,

On Sat, Oct 22, 2022 at 7:58 PM NSENGIYUMVA WILBERFORCE
<nsengiyumvawilberforce@gmail.com> wrote:
>
> Hi team,
> I am an outreachy applicant and I would like to know how I can make my
> first contribution and what the contribution should be.

Great, did you take a look at https://wiki.qemu.org/Contribute/BiteSizedTasks?

You could start with something simple to get a better understanding of
how to submit patches and then move on to some harder stuff.

You can find a lot of information on that page, let me know if you
need more details.

Thanks,
Stefano


