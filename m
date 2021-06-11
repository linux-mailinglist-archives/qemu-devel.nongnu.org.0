Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 457973A479D
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 19:16:36 +0200 (CEST)
Received: from localhost ([::1]:36866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrkln-0003hk-Bv
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 13:16:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lrkkI-0001al-EJ
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 13:15:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34176)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lrkkG-0000Lp-S8
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 13:15:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623431700;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T4TfEPrlkOjkMlDHdXMV0IDvK/7lTuoJudUCLPa1Em4=;
 b=EuAC7tHw/+I+qwucRGW9y4f6PHxLCMZpDcEFXDgE3cjBzrRBp008boz5sGTzZtpb6fMHqY
 SL7/xyTsQvKbx+jm8bl2rHKPNTtqclCb+Qz2SMTHjL1R5RXeP+5QEzYvkS0rlXw0wTlVHJ
 7PIrLELTTtp2/Dm+YwFEpX0zBwMzYtM=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-299-_kDO7fYfPhKcD5k8oZN7MQ-1; Fri, 11 Jun 2021 13:14:58 -0400
X-MC-Unique: _kDO7fYfPhKcD5k8oZN7MQ-1
Received: by mail-ej1-f72.google.com with SMTP id
 p18-20020a1709067852b02903dab2a3e1easo1392043ejm.17
 for <qemu-devel@nongnu.org>; Fri, 11 Jun 2021 10:14:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=T4TfEPrlkOjkMlDHdXMV0IDvK/7lTuoJudUCLPa1Em4=;
 b=DTqhPNtfUIleVHb84vttVsvrKop3B/peIYk6wnsQTnaGpBq/+uII6NWa3CdA27XLnN
 /rBL7RhCdRSNlDZDPqHXWFoYzBCKZj9RGVDY+sdbkgP8935F5+KNdNBJuACb2dAI4iBv
 9tcSLT02vV67d0Xw6lqYAV1NUYgO7WgL/kYSTchtXN2U2WB0ZvgoT6Pu39S1g9hK5T3n
 9E64q6ApCKPlx5GpKxqC7PYT2sqHvTMZiiJSDkyhk+UOsgGoGA+8uAhoBWKaKmH/kJ2h
 WNNizgJUCPCKAlx/iBryy1uLqszVHivQv1CHCVcRhfOPM7jixqZWoEWA1N0bqiRbNL/F
 l00A==
X-Gm-Message-State: AOAM532+ANTPZePXx/1TKXhHI/crunPlfWbyhIOQXiHqu0LwRmGgVQOa
 CAVjRKousveLK81mULoiOkZCQhaj2GwMzWoVIrd9t2WkhXpNj1Rh5fATxYhv7ocLokbJ0U+oFbO
 zTXmJKm+i99faqFY=
X-Received: by 2002:a17:906:5299:: with SMTP id
 c25mr4690083ejm.85.1623431697757; 
 Fri, 11 Jun 2021 10:14:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy0Lnd+DzdqqKOmwSVTlpi0Sr+KnA5X2VUMREoB3hyLp6xM2pYd/1uGL9stJQLIlDvfcHWMUg==
X-Received: by 2002:a17:906:5299:: with SMTP id
 c25mr4690063ejm.85.1623431697584; 
 Fri, 11 Jun 2021 10:14:57 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id bn7sm2332682ejb.111.2021.06.11.10.14.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Jun 2021 10:14:57 -0700 (PDT)
Subject: Re: [PATCH 0/4] modules: add support for target-specific modules.
To: Gerd Hoffmann <kraxel@redhat.com>
References: <20210610101553.943689-1-kraxel@redhat.com>
 <4a1a23af-461f-92c4-d9f0-1f8133d611db@suse.de>
 <20210610122305.zxdaqsft5evcrli6@sirius.home.kraxel.org>
 <b2fb96b8-415b-b2d4-168c-d43dc20ef7b6@suse.de>
 <4dffdaf1-e7e5-cb28-7f7a-2061f182ee5b@redhat.com>
 <20210611082925.7wkppsrj7hywquns@sirius.home.kraxel.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <8f53eb21-d18c-a8ee-1796-b7b6a88cca81@redhat.com>
Date: Fri, 11 Jun 2021 19:14:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210611082925.7wkppsrj7hywquns@sirius.home.kraxel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 qemu-devel@nongnu.org, Claudio Fontana <cfontana@suse.de>,
 jose.ziviani@suse.com,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/06/21 10:29, Gerd Hoffmann wrote:
> 
> Are there any pending patches to handle the remaining tcg dependencies
> in qemu?  When trying to build tcg modular (more than only
> tcg-accel-ops*) I get lots of unresolved symbols to tcg bits which are
> referenced directly (in cpu.c, gdbstub.c, monitor, ...).

I suggest that you create a wiki page with a list.  Then we can either 
see if Claudio's makefile patches tackled them, or go through them one 
by one.

Paolo


