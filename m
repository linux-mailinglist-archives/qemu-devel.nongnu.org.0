Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0FD340BD5
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 18:29:10 +0100 (CET)
Received: from localhost ([::1]:41244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMwSM-0008UV-0K
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 13:29:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lMwJF-0001BS-90
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 13:19:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48217)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lMwJD-0004I8-VS
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 13:19:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616087983;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
 b=Qb/9IdEVtDMLpjCOhe/on2wUiwVHqfP9KFNOGI1AFeGyGwrOlunNzcWY62aIZhWcThN/1B
 xNJZaXt+fToC7IUylbppZaakQxyr8uHAAw/o5a+RTs+ohdjiTeXAQz/O3DoMsbxnfaalO/
 yMhBRyKHE+QDat+tse1LwbCIrEwz0wk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-535-b7Ls3gGZMBi5UrCpN536aQ-1; Thu, 18 Mar 2021 13:17:13 -0400
X-MC-Unique: b7Ls3gGZMBi5UrCpN536aQ-1
Received: by mail-wm1-f71.google.com with SMTP id i14so12087450wmq.7
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 10:17:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
 b=aqytU5Efot0G2l4rHgggoPI+qU6ZRNVKB//x7ch19kJv522mevSGKvpuaVQVONKmmt
 emLmrZIDRoSmHTggwaRvFWlZbyqAXkcpDq6qJvauxZehGsWGlDLAKlibsMSIlkX7OODA
 VNWhJVA9xGs4QdnP0UezYBZcjavWHHpR9SThT4tODg76B/6z0hXKgfVFHSuURsaFZ+VF
 MCXArKsXovr0TQYDEPk9tmFnKj/Pc/iIl2irdBZ0ybKwE1q+iSq0WbDhQE0OitStNXV6
 wBwDkx3tSmheuLbjuVA/OqGL3ONrR27IK/jWCDltYs9IcU867NzzszCE8e5TF2GQj57K
 qx8w==
X-Gm-Message-State: AOAM531SdBo1LBeMk9FVJmqYuk/gHtvCx794VcB6O9jjYt7qBOKFuf2W
 IB39jyaoSkfM1y0swggjvRJOhjMyQb2eGPrRRi1YT+ugFJfCFyIewymTfb3fVkVdWmKbMj3hYNg
 Ofb9R9dsTgg8yV4I=
X-Received: by 2002:adf:d1e3:: with SMTP id g3mr294508wrd.195.1616087832271;
 Thu, 18 Mar 2021 10:17:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyZQot7+WYDtHcj8VM6X4/aaDgDY6Vxt2sE3qcXGKrK+MuH30P8SmEHuHA4RI+BlouRGwRtTA==
X-Received: by 2002:adf:d1e3:: with SMTP id g3mr294501wrd.195.1616087832125;
 Thu, 18 Mar 2021 10:17:12 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id x13sm3583096wrt.75.2021.03.18.10.17.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Mar 2021 10:17:11 -0700 (PDT)
To: qemu-devel <qemu-devel@nongnu.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: [not a patch] sorry folks this is another test
Message-ID: <e61b3dc7-7818-64db-762b-62866f27388f@redhat.com>
Date: Thu, 18 Mar 2021 18:17:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 13
X-Spam_score: 1.3
X-Spam_bar: +
X-Spam_report: (1.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_TONAME_EQ_TOLOCAL_SHORT=1.999, PDS_TONAME_EQ_TOLOCAL_VSHORT=0.999,
 PYZOR_CHECK=1.392, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



