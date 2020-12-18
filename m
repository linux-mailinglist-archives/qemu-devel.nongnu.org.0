Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D9E2DE3B0
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 15:09:56 +0100 (CET)
Received: from localhost ([::1]:43128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqGSB-0007oW-7F
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 09:09:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <coiby.xu@gmail.com>)
 id 1kqG4V-0004Zg-Iz; Fri, 18 Dec 2020 08:45:27 -0500
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:36063)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <coiby.xu@gmail.com>)
 id 1kqG4Q-0008FU-Bu; Fri, 18 Dec 2020 08:45:25 -0500
Received: by mail-pf1-x430.google.com with SMTP id t22so1582532pfl.3;
 Fri, 18 Dec 2020 05:45:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=fYvOeX86OX0NXs/Y28L+5vOPO2nbKpgg8BEbSj0Vyn4=;
 b=l6mvuQxnmMzzhAbTpdJw4aTu7/46+2I6S7QazTsqv6f99fxGTkexdjLeY4vmvRDGMJ
 KQ3LK5WNgmdB/+zDTyXBvcZvDyJK+mwrYGpCx7N9nHJ98mC961qVtjigcIt7ND3dfghW
 S4KubrzTdOmo7pnPfpbJRB6489GUZkjpih7/HHH8m7W/R/9cWSidrUA6E0FYdjtNTRtB
 YN6k4ObgYIJzBrPSwoKHhUckKBhW8Z58c7uIPg/VmGU85RBKZlY1MIr6oHFX7jsDhAyy
 TtM8NByTLkcQk4E2ch13gUncXLPu81Pn560JG9GJ/JXX1dcOBJF29+PwWjMFUYHZdCqC
 p1kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fYvOeX86OX0NXs/Y28L+5vOPO2nbKpgg8BEbSj0Vyn4=;
 b=fdf9lkM4lMRWlzw2J3bCsHMBIF4nK8B4t0ymnvsYIhF1hYSS7mE+1pGczPxrUhME+L
 YA9cBvqrOq1hT/757050r6V0q9UcIm4SeMhXNXWHRKMuljHM+u8q6RFjFsTUXZgssDGS
 bqssJmgDh6CFJ4LLvzN+edoWKtKnFUxJ7RMxF2f917EKPepyeyvMeD4xTOG3HJR1vXKP
 KCyqjY0c/OB4Mv9doevYaxd/WpZxvN43IIaDTTZHQWmuXxRaIX9WKKaRlB24gkCPYbu/
 q70W8VVoIbhU8GUTZ2cUvFDHcxD49Rj+vj4fa5xw4xcp1HpuZfRd2rFuXzWqVBTEshZ+
 TECA==
X-Gm-Message-State: AOAM533hAjepZdKODmGCBvWvhX06TUrvA8TPbp/M+9BfsytEhNcByKSN
 nZOJHASumJhPjSpioFRWJKg=
X-Google-Smtp-Source: ABdhPJxlWrjhw7M8Y3T5fYSUreItb5RB+qp4Mb42FHWoPqSmRGHEqZWWoL8Hb4XWzENsnWTtICtlQw==
X-Received: by 2002:a63:cf4d:: with SMTP id b13mr4267234pgj.180.1608299119113; 
 Fri, 18 Dec 2020 05:45:19 -0800 (PST)
Received: from localhost ([2001:e42:102:1532:160:16:113:140])
 by smtp.gmail.com with ESMTPSA id q23sm9406496pfg.18.2020.12.18.05.45.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Dec 2020 05:45:18 -0800 (PST)
From: Coiby Xu <coiby.xu@gmail.com>
X-Google-Original-From: Coiby Xu <Coiby.Xu@gmail.com>
Date: Fri, 18 Dec 2020 21:44:25 +0800
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH for-5.2 05/10] vhost-user-blk-test: close fork child file
 descriptors
Message-ID: <20201218134425.pk4scg4zj3j5gop3@Rk>
References: <20201111124331.1393747-1-stefanha@redhat.com>
 <20201111124331.1393747-6-stefanha@redhat.com>
 <20201124120826.cgz2oiexopucatbt@Rk>
 <20201203135721.GA878699@stefanha-x1.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20201203135721.GA878699@stefanha-x1.localdomain>
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=coiby.xu@gmail.com; helo=mail-pf1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 03, 2020 at 01:57:21PM +0000, Stefan Hajnoczi wrote:
>On Tue, Nov 24, 2020 at 08:08:26PM +0800, Coiby Xu wrote:
>> Hi Stefan,
>>
>> On Wed, Nov 11, 2020 at 12:43:26PM +0000, Stefan Hajnoczi wrote:
>> > Do not leave stdin and stdout open after fork. stdout is the
>> > tap-driver.pl pipe. If we keep the pipe open then tap-driver.pl will not
>> > detect that qos-test has terminated and it will hang.
>>
>> I wonder under which situation this would happen. I couldn't re-produce
>> this issue locally.
>
>Try adding g_assert_not_reached() to one of the tests so the qos-test
>process aborts. Then tap-driver.pl will hang because the pipe hasn't
>been closed and "make check" never completes.

Thank you for the explanation! I thought closing fork child file is
for dealing with a subtle race condition. So it's actually for dealing
with the situation when g_assert_* fails.

Do you think g_spawn_async_with_pipes is a better way than fork/exec
since g_spawn_* could help us take care of closing standard file
descriptors?

     g_test_message("starting vhost-user backend: %s",
                    storage_daemon_command->str);

     GPid child_pid;
     g_autoptr(GError) error = NULL;
     const gchar * const argv[] = { "/bin/sh", "-c", storage_daemon_command->str, NULL };
     g_spawn_async_with_pipes (NULL, argv, NULL, G_SPAWN_STDOUT_TO_DEV_NULL, NULL,
             NULL, &child_pid, NULL, NULL,
             NULL, &error);

     if (error != NULL)
     {
         g_error ("Starting qemu-storage-daemon failed: %s", error->message);
         abort();
     }
     g_string_free(storage_daemon_command, true);



--
Best regards,
Coiby

