Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33AED3066AB
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 22:49:21 +0100 (CET)
Received: from localhost ([::1]:57830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4sgi-0006lF-Aj
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 16:49:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l4sdq-0004dE-63
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 16:46:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l4sdn-0003XX-SE
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 16:46:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611783978;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3znq+LpxjXa8s0wfUA9w+Wuii4ZpDYvkb0RNpOfa4i4=;
 b=Fw7TQNX9ytvZms39FRJUR3CsqSrgzroV4dNBJzu/F+Dv67Oc75ZU6PI7jT3fboSndj7EMm
 nF5YVRI5K7AFkHb0iQMW+t7VaKbTXsJJUhlMhTEd8QHMx8UDL10y21TI6xG+w/Vqd1hamk
 S5TaTr1uCqYLZ8UzTgaVApa15QkoOes=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-321-HE86LXOyPXehVbVlK972ow-1; Wed, 27 Jan 2021 16:46:17 -0500
X-MC-Unique: HE86LXOyPXehVbVlK972ow-1
Received: by mail-wr1-f69.google.com with SMTP id x12so1914023wrw.21
 for <qemu-devel@nongnu.org>; Wed, 27 Jan 2021 13:46:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:cc:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3znq+LpxjXa8s0wfUA9w+Wuii4ZpDYvkb0RNpOfa4i4=;
 b=j8B/uesKqDM5MZUn2bhPBslJx1H5LQCrKz9eC7tqayAJFx5KE2K4qxsFFOSaekN8Gl
 qq243XWPzYu2DLH2SFsJSfJeHdWRsDHLOg420OckrTPtxTwN5CT5kaizNVAxkBhN9cxo
 413MRtGYroeJ+8AgIYZbfyY5saB86WuTmm86wqR3QW2/1Ze6eZkDiqLitA468C76fYpI
 ZgKPJslOQNrA8lQRf6kMGHaSG29y4K/GukYbgHaIdJRbqoFDCHArPlyNXjS7ELGqKtne
 fBIDRzrnlbYjPCFcIaJ3Ni9jEviJpcXiFh9xTq9gxemzR1ko8ebydcisgxQEml6DSsqR
 7xsA==
X-Gm-Message-State: AOAM531gSOrgqMwBqL5gZUHU2qKtzZFbMiFLwJvWHtZuLl2OoQp/zEDT
 SITHOrXN4k6hY2nLwU240lggq824LNmeVGVtJhj7Q0/6hY01L43ufw9ZtaroOCJbxUfTUHMex6E
 dI2xNNlbfZn56gVA=
X-Received: by 2002:adf:9427:: with SMTP id 36mr13193013wrq.271.1611783975829; 
 Wed, 27 Jan 2021 13:46:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJynWfoM96oSJjkxx4ki0Oo4/n7DxxS9A2zqTUHym+EdyibP4q1nO+i0rtEgD1rifPMzJCcjuw==
X-Received: by 2002:adf:9427:: with SMTP id 36mr13193000wrq.271.1611783975673; 
 Wed, 27 Jan 2021 13:46:15 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id u10sm3529165wmj.40.2021.01.27.13.46.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Jan 2021 13:46:15 -0800 (PST)
Subject: Re: [RFC] Change default ipv6 network from fec0/10 (site local) to
 fe80/10 (link local)
To: Doug Evans <dje@google.com>, QEMU Developers <qemu-devel@nongnu.org>
References: <CADPb22QjukHvqxTzjXUZyiO7jdDxKaHd=ioAb8SSgfrAUgiskg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <7e80b14a-e749-c5a4-69e1-83239f2ee5b1@redhat.com>
Date: Wed, 27 Jan 2021 22:46:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CADPb22QjukHvqxTzjXUZyiO7jdDxKaHd=ioAb8SSgfrAUgiskg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.308,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: libvir-list@redhat.com, Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Jason Wang <jasowang@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Doug,

Cc'ing more developers.

On 1/27/21 8:13 PM, Doug Evans wrote:
> Hi.
> 
> This is just an information gathering question. I don't know enough to
> formally propose the change.
> I happened to notice QEMU's default for the ipv6 network is fec0::/10
> which is deprecated (RFC3879).
> I think(!) an obvious replacement is fe80::/10, link local.
> 
> Has anyone thought about this issue or know of reasons why we shouldn't
> make this change?

I'm a bit worried this could break various scripts and firewall rules
where this is the expected default range...


