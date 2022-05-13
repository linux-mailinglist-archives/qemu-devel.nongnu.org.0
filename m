Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AAC1525C48
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 09:20:04 +0200 (CEST)
Received: from localhost ([::1]:43054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npPal-0006Aj-Hu
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 03:20:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1npPO8-0005ie-00
 for qemu-devel@nongnu.org; Fri, 13 May 2022 03:07:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34064)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1npPO4-00060G-Qw
 for qemu-devel@nongnu.org; Fri, 13 May 2022 03:06:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652425616;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=b9blYXum31mhkd76jJm4ku1OCG1AOKkx3man1tLg2LNPlq+VqgVtllzSBOt/XZwtUhlznT
 a3U4QVs/lk5c+XI02tzePLZRQN0t3y0IVjewLpC3RVrSzlNGBqDv4bvsBJim7PAtzvgnIn
 2pfL6ymRsjdvFAe1J3/w+LCzGHz4Iow=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-621-tFqLpHESMjCAaoqQWB1hnQ-1; Fri, 13 May 2022 03:06:54 -0400
X-MC-Unique: tFqLpHESMjCAaoqQWB1hnQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 b3-20020aa7d483000000b004282ca95814so4411820edr.9
 for <qemu-devel@nongnu.org>; Fri, 13 May 2022 00:06:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=eAVdugHT3NNYyY8Md/lN7iDl9efQO469U3v1ergA55e9qG7Oj3vwQFuWfk9+0l7Fsv
 p9UFhtP68aRVQfwDm2JjGy64fvKOL3VStdPAWmuYpHBJLgZCyLEoVC+TIMt6MZGCmY9J
 DwbTGjOgjATcLZTZIk50pXpzK7QdPjAIRSy7SBpWP3h5uFsiYm8quSVb2+/UdmJcxyaH
 NWAGEH/q9VMB5V8nr7x/9lRoKjc34DSF/jEO3Q7UJlf5cUlFljDP0E2L32xiWqpLcMbK
 7TxZIQNAs9ut1o41uhukV0E4Vt17APDNLh+zIaO3DcQWv0V3NFag0jqYAixxGNe/5STq
 D6sg==
X-Gm-Message-State: AOAM5338IbopLt2T9ej25/aUNl0w6IESD9FCh+2V7mBAKu7aMkUkmf79
 TWHroT1lQX2gMpylV/AVyWW9sTb6W5a3d8DzrbMnrBu+TN4/nlPukqV7HOtL4zDIh4PiY4zEiLg
 hSOXIttWti/mNYQo=
X-Received: by 2002:a17:907:2159:b0:6f3:a307:d01d with SMTP id
 rk25-20020a170907215900b006f3a307d01dmr3050200ejb.760.1652425613592; 
 Fri, 13 May 2022 00:06:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzq3ItHW/u2kpWwAAG5m+z/b5b1NhNq/jishWHC9Go0Nc6+bGOeXmuZErVJ6hWaqHBVR/h9aQ==
X-Received: by 2002:a17:907:2159:b0:6f3:a307:d01d with SMTP id
 rk25-20020a170907215900b006f3a307d01dmr3050182ejb.760.1652425613335; 
 Fri, 13 May 2022 00:06:53 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 u6-20020a170906108600b006f3ef214e50sm444060eju.182.2022.05.13.00.06.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 May 2022 00:06:52 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Konstantin Kostiuk <kkostiuk@redhat.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Michael Roth <michael.roth@amd.com>
Subject: Re: [PATCH] qga-vss: Add auto generated headers to dependencies
Date: Fri, 13 May 2022 09:06:50 +0200
Message-Id: <20220513070650.1076595-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220512154906.331399-1-kkostiuk@redhat.com>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Queued, thanks.

Paolo


