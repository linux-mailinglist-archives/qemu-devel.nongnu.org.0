Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1124C18B239
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Mar 2020 12:19:07 +0100 (CET)
Received: from localhost ([::1]:36308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jEtCc-0006z5-4k
	for lists+qemu-devel@lfdr.de; Thu, 19 Mar 2020 07:19:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37470)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@gmail.com>) id 1jEtBo-0006YW-Fj
 for qemu-devel@nongnu.org; Thu, 19 Mar 2020 07:18:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@gmail.com>) id 1jEtBn-0003xt-15
 for qemu-devel@nongnu.org; Thu, 19 Mar 2020 07:18:16 -0400
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a]:32827)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <stefanha@gmail.com>) id 1jEtBm-0003xQ-TT
 for qemu-devel@nongnu.org; Thu, 19 Mar 2020 07:18:14 -0400
Received: by mail-qk1-x72a.google.com with SMTP id p6so2603545qkm.0
 for <qemu-devel@nongnu.org>; Thu, 19 Mar 2020 04:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=3ayIiV45+D13+klB3U+OZugCICnaVF9i6WaY9DphZ5g=;
 b=g5gQKruLuaQygbqb8cGs/lmVzAfJvqFpYyGYUp6FirpW31ZqEG4wswuU7eoMzvVrCH
 VhXxQkL0nrzl/yVqYb9shPbsqYJbWSu9N1DWQg8ozXdJ8fdJSZwy2LM47ayTjBT1BV/n
 2ajCVxxlUrJFvQDQIw85X67ILOKf6jk24ElaVO9IXpUSsjvheoCf063/wD2+vAWERbD4
 sHkdLM+c0EMwmswNagdaO98LKeM9uio4TmJMB5hi1YMZSWSt4w3Ru2YyFgvqnXPYN2Ek
 lI+24oxJNjA1psBkMyF7CkFDMbqVb94AmfOa+PL2jQ+Q/mQWSotkaLTX0H2+7D/dFbqH
 H3HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=3ayIiV45+D13+klB3U+OZugCICnaVF9i6WaY9DphZ5g=;
 b=dKO3PKwMNqGzOFZEJE3hwzn8KlUlXC8DgV1R+hCyjSlAxaEca8T7Jrj6TCMcb72/3o
 nF/81+FshW0XeFjY+DUTbz/h7uYzYpjTtbKN3K+wOR/u40fqlgHZzpsJdBzg/zv7a2E8
 HyAlcaZDRx64ZoT20kIbqY9NDxRJVFgTHVesfMk9xwL4mcfiCBFB2ex7r3YOdQoDw7jw
 fvQ35WP6qAXoEuEhTn0tyqvKGir4njv1wS8jfE+LILIllwMQaoQRU9S32RI2vfsIoPJg
 MLjlqojnH+vmCMb0WBSOl5WhhZE3pcZKFEFEKgqX2PRRoSaJ5QkYLebpOd9nDkdgnwoN
 hI3A==
X-Gm-Message-State: ANhLgQ2S493VLcyT+CmLO0E2b+/mkOcQkgozvAwPs1a3zOjLUhI+e4yQ
 cpOkRbK47PyMSmYg+g+x0aZlKoh7haMBjh1s1fTzrud4heg=
X-Google-Smtp-Source: ADFU+vsjQFvURNLrR22OtvLwiUImhSDVKqfOmsxk3RcOhKjqgHFjUIArWb5hrZslK30uOmhbVOYbYZn1qr1nR05FEKw=
X-Received: by 2002:a37:7a46:: with SMTP id v67mr2295136qkc.87.1584616693219; 
 Thu, 19 Mar 2020 04:18:13 -0700 (PDT)
MIME-Version: 1.0
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Thu, 19 Mar 2020 11:18:02 +0000
Message-ID: <CAJSP0QU0dMtqVkPspCbjAqpUs+AJAiqZUnhzUYRFZ3t=7URzmQ@mail.gmail.com>
Subject: Use the new lock guard macros for safe locking
To: qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::72a
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

Below is a wiki page I just created explaining the lock guard macros
that make locking code simpler and safer.

I wanted to make everyone aware of these new macros.  Please consider
using them!

Thanks,
Stefan
---
From https://wiki.qemu.org/ToDo/LockGuards:

Lock guards are a safe alternative to manual lock()/unlock() calls.
They take a lock and automatically unlock it at the end of the scope
or when the function returns.  This prevents common bugs when locks
are not released in error code paths.

Lock guards were added to QEMU in March 2020.  Much of the codebase
does not take advantage of them yet.  This page explains how to use
them and when to convert existing code.

==Lock guard macros==
Two lock guard macros are defined in "qemu/lockable.h":

  /**
   * WITH_QEMU_LOCK_GUARD - Lock a lock object for scope
   *
   * @x: a lock object (currently one of QemuMutex, CoMutex, QemuSpin).
   *
   * This macro defines a lock scope such that entering the scope takes the lock
   * and leaving the scope releases the lock.  Return statements are allowed
   * within the scope and release the lock.  Break and continue statements leave
   * the scope early and release the lock.
   *
   *   WITH_QEMU_LOCK_GUARD(&mutex) {
   *       ...
   *       if (error) {
   *           return; <-- mutex is automatically unlocked
   *       }
   *
   *       if (early_exit) {
   *           break;  <-- leave this scope early
   *       }
   *       ...
   *   }
   */
  #define WITH_QEMU_LOCK_GUARD(x)

and

  /**
   * QEMU_LOCK_GUARD - Lock an object until the end of the scope
   *
   * @x: a lock object (currently one of QemuMutex, CoMutex, QemuSpin).
   *
   * This macro takes a lock until the end of the scope.  Return statements
   * release the lock.
   *
   *   ... <-- mutex not locked
   *   QEMU_LOCK_GUARD(&mutex); <-- mutex locked from here onwards
   *   ...
   *   if (error) {
   *       return; <-- mutex is automatically unlocked
   *   }
   */
  #define QEMU_LOCK_GUARD(x)

==How to use lock guards==
Use WITH_QEMU_LOCK_GUARD() when the lock must be released before the
end of the function.  Use QEMU_LOCK_GUARD() when the lock must be held
until the end of the function.

Here is an example conversion from manual lock()/unlock() calls to
WITH_QEMU_LOCK_GUARD().  Before:

  qemu_mutex_lock(&mutex);
  if (data == NULL) {
      qemu_mutex_unlock(&mutex);
      return false;
  }
  ...use data...
  qemu_mutex_unlock(&mutex);
  return true;

After:

  WITH_QEMU_LOCK_GUARD(&mutex) {
      if (data == NULL) {
          return false;
      }
      ...use data...
  }

Notice that it is no longer necessary to manually call qemu_mutex_unlock().

==Which types of locks are supported==
QemuMutex, QemuRecMutex, CoMutex, and QemuSpin are supported by
WITH_QEMU_LOCK_GUARD() and QEMU_LOCK_GUARD().

The RCU read lock has its own WITH_RCU_READ_LOCK_GUARD() and
RCU_READ_LOCK_GUARD() macros in "qemu/rcu.h" that can replace manual
rcu_read_lock()/rcu_read_unlock() calls.

==When to convert existing code to lock guards==
Lock guards usually make code easier to read by eliminating unlock()
calls and gotos.  However, there are some exceptions where it is
either not worth it or when lock guards cannot handle complex cases.

They do not provide a significant advantage for straight-line code
without conditional statements:

  qemu_mutex_lock(&mutex);
  data++;
  qemu_mutex_unlock(&mutex);

Leave simple code alone because it is not worth developing and
reviewing patches that have no benefit.

They also do not handle complex control flow such as loops that
temporarily drop a lock:

  qemu_mutex_lock(&mutex);
  while (running) {
      ...
      qemu_mutex_unlock(&mutex);
      wait();
      qemu_mutex_lock(&mutex);
      ...
  }
  qemu_mutex_unlock(&mutex);

Although lock guard macros could be mixed with manual lock()/unlock()
calls to handle some complex control flow cases, this can be subtle
and may lead to bugs.  Do not try to convert these cases to use lock
guards.

