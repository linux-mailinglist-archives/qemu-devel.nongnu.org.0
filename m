Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38EB544C228
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 14:33:20 +0100 (CET)
Received: from localhost ([::1]:39452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mknj5-0002Mp-CK
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 08:33:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den-plotnikov@yandex-team.ru>)
 id 1mknfq-00089Z-KF
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 08:29:58 -0500
Received: from forwardcorp1j.mail.yandex.net ([5.45.199.163]:49644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den-plotnikov@yandex-team.ru>)
 id 1mknfl-0001k6-IK
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 08:29:57 -0500
Received: from sas1-4cbebe29391b.qloud-c.yandex.net
 (sas1-4cbebe29391b.qloud-c.yandex.net
 [IPv6:2a02:6b8:c08:789:0:640:4cbe:be29])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id 57E812E1974;
 Wed, 10 Nov 2021 16:29:42 +0300 (MSK)
Received: from myt6-10e59078d438.qloud-c.yandex.net
 (myt6-10e59078d438.qloud-c.yandex.net [2a02:6b8:c12:5209:0:640:10e5:9078])
 by sas1-4cbebe29391b.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 5plW6CCbEn-TgsaDHkL; Wed, 10 Nov 2021 16:29:42 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1636550982; bh=XGfnkNveMkQymf3FYr4cg0RNdJj5cq1M442tE10yOzU=;
 h=In-Reply-To:References:Date:From:To:Subject:Message-ID:Cc;
 b=GLpPJmtYVB9m2gfzxgzBphMwUYftZwKKMdZJEOtxyTmFZhCLm8Rnc6tgVnQLcYrux
 hinsMs1Zufw8ef5l1s1oRBk+tYxiJeuMuiHcrFOrPl+bsscqp7MF0jeXc8w83LzptE
 ZiZjhMNlUJbNm8QBsPkr79pn+D0VRuJfoDa4Cda4=
Authentication-Results: sas1-4cbebe29391b.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from [IPv6:2a02:6b8:b081:8007::1:3b] (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b081:8007::1:3b])
 by myt6-10e59078d438.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPS id
 FEkVxdfcDt-Tfx8wnfO; Wed, 10 Nov 2021 16:29:41 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 2
Subject: Re: [Ping][PATCH v0] vl: flush all task from rcu queue before exiting
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20211102133901.286027-1-den-plotnikov@yandex-team.ru>
 <96bfe630-fb3d-2ac8-60b8-ae23ed7b3742@yandex-team.ru>
 <5830d625-de03-7dc7-c662-e434ebeaa651@redhat.com>
From: Denis Plotnikov <den-plotnikov@yandex-team.ru>
Message-ID: <830c8775-4d39-f91c-d223-2934d8cc1c21@yandex-team.ru>
Date: Wed, 10 Nov 2021 16:29:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <5830d625-de03-7dc7-c662-e434ebeaa651@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=5.45.199.163;
 envelope-from=den-plotnikov@yandex-team.ru; helo=forwardcorp1j.mail.yandex.net
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.678,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: yc-core@yandex-team.ru, mlevitsk@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 09.11.2021 20:46, Paolo Bonzini wrote:
> On 11/9/21 08:23, Denis Plotnikov wrote:
>> Ping ping!
>
> Looks good, but can you explain why it's okay to call it before 
> qemu_chr_cleanup() and user_creatable_cleanup()?
>
> I think a better solution to the ordering problem would be:
>
>   qemu_chr_cleanup();
>   user_creatable_cleanup();
>   flush_rcu();
>   monitor_cleanup();
I agree, this looks better
>
> with something like this:
>
> diff --git a/chardev/char-fe.c b/chardev/char-fe.c
> index 7789f7be9c..f0c3ea5447 100644
> --- a/chardev/char-fe.c
> +++ b/chardev/char-fe.c
> @@ -195,6 +195,7 @@ bool qemu_chr_fe_init(CharBackend *b,
>      int tag = 0;
>
>      if (s) {
> +        object_ref(OBJECT(s));
>          if (CHARDEV_IS_MUX(s)) {
>              MuxChardev *d = MUX_CHARDEV(s);
>
> @@ -241,6 +242,7 @@ void qemu_chr_fe_deinit(CharBackend *b, bool del)
>              } else {
>                  object_unref(obj);
>              }
> +            object_unref(obj);
>          }
>          b->chr = NULL;
>      }
>
> to keep the chardev live between qemu_chr_cleanup() and 
> monitor_cleanup().

but frankly speaking I don't understand why we have to do ref/unref in 
char-fe interface functions, instead of just ref/uref-ing monitor's char 
device directly like this:

diff --git a/monitor/monitor.c b/monitor/monitor.c
index 21c7a68758f5..3692a8e15268 100644
--- a/monitor/monitor.c
+++ b/monitor/monitor.c
@@ -611,6 +611,7 @@ void monitor_data_destroy(Monitor *mon)
  {
      g_free(mon->mon_cpu_path);
      qemu_chr_fe_deinit(&mon->chr, false);
+    object_unref(OBJECT(&mon->chr));
      if (monitor_is_qmp(mon)) {
          monitor_data_destroy_qmp(container_of(mon, MonitorQMP, common));
      } else {
@@ -737,6 +738,7 @@ int monitor_init(MonitorOptions *opts, bool 
allow_hmp, Error **errp)
          error_propagate(errp, local_err);
          return -1;
      }
+    object_ref(OBJECT(chr));
      return 0;
  }

May be this shows the intentions better?

Denis

>
> Paolo
>

