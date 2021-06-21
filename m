Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66CBB3AEBE5
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 16:59:38 +0200 (CEST)
Received: from localhost ([::1]:55744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvLOj-0008Sm-8x
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 10:59:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lvLNb-0007mZ-12
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 10:58:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36245)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lvLNY-0003Jm-Ii
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 10:58:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624287502;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Evv4xtapzONpGPlSm4KAOWA1w8Mnl+5b9rJEW9g+v48=;
 b=RRkpTruaw0wBPX+tsn3Ynt3K2F/TPKGSs72vQnYhTIeJylJ6Fu4zsIqkozzlP1IZoRgTI+
 3iupz3FmZyenoddjhX8CtXPvPEw+bhtFLLFjJQ4V9w3YifF2Mn5MRhL31Sbayeiam2Lr29
 Jb1gCfRBUo3/wIJBgA4tXOz9lOstdpk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-517-bB2g-e0iNqKp8Y1kI5Duaw-1; Mon, 21 Jun 2021 10:58:20 -0400
X-MC-Unique: bB2g-e0iNqKp8Y1kI5Duaw-1
Received: by mail-wr1-f71.google.com with SMTP id
 d9-20020adffbc90000b029011a3b249b10so8473865wrs.3
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 07:58:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:cc:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Evv4xtapzONpGPlSm4KAOWA1w8Mnl+5b9rJEW9g+v48=;
 b=svNA6lPtgDRG0GDhZSKQ3L+x344hMvWQrwTIU5Pq9rI5paX9oOX7CE7sqyPqfrODlM
 gZFF4wIprXK4AdpspGOF1aqaRrY9yT7Qk2p3DH/f0OTXj3cxeTPyftCNZmsoORZpSAxx
 xAtO1K1hQQ9fj999VpuawJsEXJtGNYgGkGq6OU3WE3PgsiF1X6qqRpPHz1Ah2rPN0uoq
 t+rYugV1hcpK7zVrGF7ozjiV2KkfPrfkyqwP9fShfAdHT/zh2QduzSekeAXmjFqT0Xsk
 +FWUhb97CpVXQnVKajanF+F20GPKYaP0nnS/4QdrDaO1KMDFch8i9ALi3mw95qsG830v
 fLiQ==
X-Gm-Message-State: AOAM531ZqzEHfiWBIhTmoZJy6ZLtjOocHRyHLicQjPJC2vicPSQ0KK7O
 SOJpbWeXgGQV8V41POTFkt47yp0YD54reDd7ilR3skRruxfzY2dyBD5qYOpEZscf+/rq0/E5M8u
 5oRsehOGmXK7lB94=
X-Received: by 2002:a05:600c:414e:: with SMTP id
 h14mr19818083wmm.6.1624287498974; 
 Mon, 21 Jun 2021 07:58:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzH2zkiBpu8NVBloyHrga5BQjiSQBGwlOi0hzgTnR0YvWBxOpD4IoAUKcvH0JizUKHrUJYVNg==
X-Received: by 2002:a05:600c:414e:: with SMTP id
 h14mr19818060wmm.6.1624287498771; 
 Mon, 21 Jun 2021 07:58:18 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id h206sm7719073wmh.33.2021.06.21.07.58.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jun 2021 07:58:18 -0700 (PDT)
Subject: Re: RFC: Implementation of QMP documentation retrieval command
To: "Niteesh G. S." <niteesh.gs@gmail.com>, John Snow <jsnow@redhat.com>
References: <CAN6ztm8D4VMf7p-trHNHoOA+1kAXXufTTaHpbyNXZ5qO2_uuPg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <6fb6d9d7-3af2-c487-a1d4-aa1140c5a54d@redhat.com>
Date: Mon, 21 Jun 2021 16:58:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAN6ztm8D4VMf7p-trHNHoOA+1kAXXufTTaHpbyNXZ5qO2_uuPg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, ehabkost@redhat.com,
 qemu-devel@nongnu.org, wainersm@redhat.com, armbru@redhat.com,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Niteesh,

On 6/16/21 5:48 PM, Niteesh G. S. wrote:
> Hello,
> 
> We now have a reasonably working prototype that is capable of
> sending/receiving
> commands/responses, syntax highlighting, and a simple notification
> system. The
> prototype can be found here
> https://gitlab.com/niteesh.gs/qemu/-/tree/aqmp-tui-prototype
> <https://gitlab.com/niteesh.gs/qemu/-/tree/aqmp-tui-prototype>
> Working on this prototype gives us a lot of hints on things to worry
> about and other
> ideas that were worth implementing. Our next goal is to start working on
> the real TUI
> based on this prototype.
> 
> One requested feature of the TUI was to show documentation for the
> commands typed.
> To achieve this, a QMP command that lets us query the documentation from
> QEMU has
> to be implemented and some discussion has already been done on it in a
> previous thread.
> I request all continue that discussion here and suggest ideas regarding
> implementation.
> The goal is to come up with something small and simple which can also be
> improved upon
> after the summer.
> 
> I have a simple implementation of the command that returns dummy
> documentation here
> https://gitlab.com/niteesh.gs/qemu/-/commit/796a41fb2840b9f3484c6fd5672e6fceb73acaef
> <https://gitlab.com/niteesh.gs/qemu/-/commit/796a41fb2840b9f3484c6fd5672e6fceb73acaef>

I noticed your mail got no comment, and realized you asked us to
review your patches apart from the mailing list. I am not sure
if this is an experiment or a misunderstanding, but so far it is
unlikely you get review external to the mailing list, because it
is not very practical to reviewers.

Maybe some reviewers are willing to look at your tree, but if you
are looking for a wider audience, I recommend you to follow this
process (which you already used!):
https://wiki.qemu.org/Contribute/SubmitAPatch#Submitting_your_Patches

Regards,

Phil.


