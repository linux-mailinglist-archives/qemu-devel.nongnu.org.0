Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 548D5275F84
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Sep 2020 20:13:08 +0200 (CEST)
Received: from localhost ([::1]:51678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kL9GN-0001Xs-Ba
	for lists+qemu-devel@lfdr.de; Wed, 23 Sep 2020 14:13:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kL9Eb-0000qF-Ac
 for qemu-devel@nongnu.org; Wed, 23 Sep 2020 14:11:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kL9EY-0006vc-Sz
 for qemu-devel@nongnu.org; Wed, 23 Sep 2020 14:11:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600884673;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=klxEdUJCpYP3TKmIkTSFCXbK4wAOMbsMOnii52sX7I8=;
 b=WgJOy34yTPBdrOXkWLWQrbP0T16PPavKXZsCuyG8PLHe6CxOCAmZAcq5Xb+INwCKsmd+wO
 mOOBVi0XlgDXc//YXJw0kp53/cnnH7WFrguEOKubN6TQ7UmonKZ7D4NvRY+W8T0sdjpUtr
 t6bLbZaAkiIHw9C2JXloCZJYxxVMJrw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-508-D0dD-hAnOeORGMg4dZgnZA-1; Wed, 23 Sep 2020 14:11:11 -0400
X-MC-Unique: D0dD-hAnOeORGMg4dZgnZA-1
Received: by mail-wm1-f70.google.com with SMTP id l15so220404wmh.9
 for <qemu-devel@nongnu.org>; Wed, 23 Sep 2020 11:11:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=klxEdUJCpYP3TKmIkTSFCXbK4wAOMbsMOnii52sX7I8=;
 b=mZPDbG7Vse5Ruu+ipjlsqd9a37it0T/G3h0bto2WaEBJMNKt28txHJmeEhBH6ISa6f
 Iz906Fa9q/9PieAVE+d8DN1yBOOXfIsqBVNBx2JLIJ7P6AZvKVo0Nt3BEMLnGfPh5Dje
 IXlJz1mZfncGdod5vNtHk8XTKkONM/I8/I9zXlfSVwwnrvGTn/4qENeSTaddvDJYUujF
 izMgeaXbSIz2eaIq3WAYqqC39GeUB4gAiHsaia4UemHv9Mf/NCYdRnc15fFfenpWZmKS
 DENte+I6WcZZtY2yH68tkYFeyo7hUNPJMOxDT545+46VqFpocxi4R7X7mTV5PJeD1RA0
 O8QQ==
X-Gm-Message-State: AOAM533bPhEHGZ5bYENwg58yfnIx+SQTxZlHHkCIYgL7QKMZ9R/7Ksri
 PlAYwScgnUPjYHGAQihXgHXGJWljqE8AbyeX+qyrK9x1u44A2lkG8T2UCrgMdrMczn+y6f5fzEe
 rz/Hs5JejJraAMPU=
X-Received: by 2002:a1c:4885:: with SMTP id v127mr794831wma.129.1600884670577; 
 Wed, 23 Sep 2020 11:11:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy+HX0otfvH1Q/xnWZl5utUuV1j4mca0zFrOnJEzjc4Xetkl8hyHxVQC+aWZJ7yQG+5z3AbEQ==
X-Received: by 2002:a1c:4885:: with SMTP id v127mr794809wma.129.1600884670360; 
 Wed, 23 Sep 2020 11:11:10 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:ec8f:2b97:1838:78bf?
 ([2001:b07:6468:f312:ec8f:2b97:1838:78bf])
 by smtp.gmail.com with ESMTPSA id p1sm10915514wma.0.2020.09.23.11.11.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Sep 2020 11:11:09 -0700 (PDT)
Subject: Re: [PATCH v2 7/7] hw/net/can: Correct Kconfig dependencies after
 switch to meson build.
To: Pavel Pisa <pisa@cmp.felk.cvut.cz>
References: <cover.1599168753.git.pisa@cmp.felk.cvut.cz>
 <dd539770e9c182125a9c3d87b9ca329121b11abc.1599168753.git.pisa@cmp.felk.cvut.cz>
 <9bd9046d-9a16-3c23-3044-4446a9a05b55@redhat.com>
 <202009231944.14734.pisa@cmp.felk.cvut.cz>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <57e09d4f-2d93-818c-2930-be6ae559b2c9@redhat.com>
Date: Wed, 23 Sep 2020 20:11:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <202009231944.14734.pisa@cmp.felk.cvut.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/23 00:53:58
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.228,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: Marek Vasut <marex@denx.de>, Vikram Garhwal <fnu.vikram@xilinx.com>,
 Jiri Novak <jnovak@fel.cvut.cz>, Stefan Hajnoczi <stefanha@gmail.com>,
 Deniz Eren <deniz.eren@icloud.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 Oleksij Rempel <o.rempel@pengutronix.de>,
 Konrad Frederic <frederic.konrad@adacore.com>,
 Jan Charvat <charvj10@fel.cvut.cz>, Jan Kiszka <jan.kiszka@siemens.com>,
 Oliver Hartkopp <socketcan@hartkopp.net>, Ondrej Ille <ondrej.ille@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/09/20 19:44, Pavel Pisa wrote:
> 
> If you have not pushed code to the mainline yet,
> consider v3 which should follow better actual
> mainline state. The list of updates to v3 follows.

I actually queued v3 (I just use patchew to queue patches).

Paolo


