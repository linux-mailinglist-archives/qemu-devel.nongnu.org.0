Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2383D1A15
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 01:01:23 +0200 (CEST)
Received: from localhost ([::1]:56208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6LDN-0004rX-OA
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 19:01:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1m6LBz-00047n-AZ
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 18:59:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1m6LBt-0001Nw-Aw
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 18:59:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626908387;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=47RetXI69sPDP4YlzmGAWmIf7UHgY5vL2M8b8oprqLE=;
 b=I0Q1XrSQaTfn2bVz3XOxMMTjMV6HNZDfw8cn3EthccpgB2Y8qMcc9k+Blgo2TQw6GaSSOm
 SBIa11eIyIQ+n1/oZ1z2wdi3e2UjEDcPuq7hsGMVr0MoFz8vLm5xhau2238aYV4VkIH3NT
 WbHU65ve7WFizRonCWxxkOshYzvvfJI=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-366-CuuqVkxnOoetMOzpOIF3_g-1; Wed, 21 Jul 2021 18:59:46 -0400
X-MC-Unique: CuuqVkxnOoetMOzpOIF3_g-1
Received: by mail-io1-f71.google.com with SMTP id
 m14-20020a5d898e0000b02904f7957d92b5so2597806iol.21
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 15:59:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=47RetXI69sPDP4YlzmGAWmIf7UHgY5vL2M8b8oprqLE=;
 b=oCH0kqVixZFQuNNUWoO1UM6Z0o2iQ2BaBcn+va4PpyRQ86l2K1Hd9xWrXGitWa77+4
 icPKprccv+7+I0cWo7jtyaFsLZQkXgrD7MQDVOBVsdI4hKqT1yyPcp3UFFVyhY5kh9+v
 Zcnp3jXvq54sSUmVE5Ljs6DM8FNCdeym/54u6tj8dlN5l1G9QSEhl/rgRU84Ur5iSHt4
 LDd0+yn6P2TysxZHBdvsMVn+MCwbLEnHCEumf9j9vOOinaVnVc69YmJPnjbRgC70NXL4
 ghEM/xfZqtYnsLBcyaP2wTkxsJImIHB8sNjTGGv+Yayff/wBDNs36XGTgxwVTWlf9QqM
 HEmQ==
X-Gm-Message-State: AOAM532ddh7H4x/3IhwbebwTZAHkUbAqG6DnuSEtsYm+2OBCadwInaiW
 IlWPBzJsqqS2I1ElFkA95gO3du6fgkPj3VjcKekKrI3PQRWxu5hxmGByhX8C490qAX7qKxL5su/
 /jWusxH23OChAjoY=
X-Received: by 2002:a05:6e02:1a28:: with SMTP id
 g8mr25821248ile.128.1626908385539; 
 Wed, 21 Jul 2021 15:59:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzaovbuji8wze8xwNRY0Kf7KQ6A/otsT7PbgdrI6X1nrTjVg3z+1/CokmE7ScRhKUYdh5gFXQ==
X-Received: by 2002:a05:6e02:1a28:: with SMTP id
 g8mr25821242ile.128.1626908385345; 
 Wed, 21 Jul 2021 15:59:45 -0700 (PDT)
Received: from [192.168.0.173] (ip68-102-25-176.ks.ok.cox.net. [68.102.25.176])
 by smtp.gmail.com with ESMTPSA id t11sm5269020ioc.4.2021.07.21.15.59.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jul 2021 15:59:44 -0700 (PDT)
Subject: Re: [PATCH] docs: convert writing-qmp-commands.txt to
 writing-qmp-commands.rst
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20210721165015.2180311-1-jsnow@redhat.com>
From: Connor Kuehl <ckuehl@redhat.com>
Message-ID: <9df6380a-dea3-7142-19d9-2b006ba7e026@redhat.com>
Date: Wed, 21 Jul 2021 17:59:43 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210721165015.2180311-1-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ckuehl@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ckuehl@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.459,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.117, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/21/21 11:50 AM, John Snow wrote:
> This does about the bare minimum, converting section headers to ReST
> ones and adding an indent for code blocks.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---

Looks like ReST! The generated document also looks good to me.

Reviewed-by: Connor Kuehl <ckuehl@redhat.com>


