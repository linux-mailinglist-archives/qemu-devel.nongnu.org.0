Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A1337AEDB
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 20:55:26 +0200 (CEST)
Received: from localhost ([::1]:43238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgXXR-0006J3-FI
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 14:55:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lgXVt-0005ea-B4
 for qemu-devel@nongnu.org; Tue, 11 May 2021 14:53:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lgXVq-00040X-4W
 for qemu-devel@nongnu.org; Tue, 11 May 2021 14:53:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620759224;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BfMDIicLoCqizeSSjad3FEamKNLsDI95SujX0uUHSyA=;
 b=J7BTMjppc47dR/EcskKJj6C789F1RveWr8SBseZaB8y8KFSDOtqEkd0unwDh5lCTT3QBjN
 2LryNA6Q9uISm1y5RvtOsLfE1bISBvj0Vpb/d3B7nXC3cmnneGFbrxY9KbBftr2IyDA8T1
 O7GTdksHSymNW0Wo2wUtoWOwXLtOmN0=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-490-mKoqAOEiPOizNpalVL3pJA-1; Tue, 11 May 2021 14:53:42 -0400
X-MC-Unique: mKoqAOEiPOizNpalVL3pJA-1
Received: by mail-oi1-f198.google.com with SMTP id
 p124-20020acad8820000b029013d36f4aa65so11587049oig.18
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 11:53:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BfMDIicLoCqizeSSjad3FEamKNLsDI95SujX0uUHSyA=;
 b=S3vUh09rWbxGjkmLLdDyu/CCBn0V4paAD2jJ+s9iSKAafJPiLU8M1UPwf/sIr4ziFZ
 Do1doTSxDcQTo07IzS31CB8em3058IJFBkJcc6U/m7i/xbb5NgLl65mcoUllKnDWby0p
 FAd2vN4a08mAaaZaPHQ+FvwKxgCijZujbmHO8PhzFooIrrR+pHMS7f5PUypNpjvAYFra
 LfPo2/zA0K00qtkW1vlOqRNxtQb4HDX1rIuPTCjNI/STGQE376kCJrpj5ZhKTZdcfL4X
 UB1YJD+QwcBy9s/V9pUqIRtEjo77nWbe6K4SfVHGjr8is51IuN0O7utvD+ydPs0i+NcL
 hOdg==
X-Gm-Message-State: AOAM532cRA+2E6149qRepGkWkorAqzEePwDy7oScsADta72tThdYoxct
 dZEvyzsug0HXK8wlEeIkzYMEqHFMVqpkGj62v17z0JN4f0EcehtKwkpFzcaDnED+cWR1NgUzyGw
 7jyX73koIVg4RjqU=
X-Received: by 2002:aca:c64a:: with SMTP id w71mr4830765oif.44.1620759221889; 
 Tue, 11 May 2021 11:53:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxb4laR4dQAOBudxZx+2acmceTlN21uY/a0ThbIx6jwqx4mZOvRIIhPe2BZButa/fKjcGzYmw==
X-Received: by 2002:aca:c64a:: with SMTP id w71mr4830751oif.44.1620759221735; 
 Tue, 11 May 2021 11:53:41 -0700 (PDT)
Received: from [192.168.0.112] (ip68-103-222-6.ks.ok.cox.net. [68.103.222.6])
 by smtp.gmail.com with ESMTPSA id
 v22sm1445560oic.37.2021.05.11.11.53.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 May 2021 11:53:41 -0700 (PDT)
Subject: Re: [PATCH 2/2] net/tap: fix error reporting when bridge helper
 forgets to send an FD
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210505121236.532755-1-berrange@redhat.com>
 <20210505121236.532755-3-berrange@redhat.com>
From: Connor Kuehl <ckuehl@redhat.com>
Message-ID: <016fea53-3482-b85b-c5e0-9ea70d49aace@redhat.com>
Date: Tue, 11 May 2021 13:53:39 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210505121236.532755-3-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ckuehl@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ckuehl@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Jason Wang <jasowang@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/5/21 7:12 AM, Daniel P. Berrangé wrote:
> [..]
> The recv_fd() method returns -1 on error, 0 on end of file, or an FD
>   $ qemu-system-x86_64 -netdev bridge,br=br99,helper=/bin/true,id=ns0
>   qemu-system-x86_64: -netdev bridge,br=br99,helper=/bin/true,id=ns0:
>     bridge helper did not send a file descriptor
> [..]
>          }
> +
> +        /*
> +         * ret == 0 means EOF, and if status == 0 then helper
> +         * exited cleanly but forgot to send us an FD. Opps...
> +         */
> +        if (ret == 0) {
> +            error_setg(errp, "bridge helper did not send a file
> descriptor");

Is it possible to include the name of the helper that's at fault here?
Could be helpful for debugging if the command line includes multiple
netdev opts with a helper parameter (unless that's literally impossible).

Connor


